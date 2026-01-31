#!/usr/bin/env node
// Browser test: loads solar/index.html and checks for JS errors

const { chromium } = require('playwright');
const http = require('http');
const fs = require('fs');
const path = require('path');

const PORT = 18765;
const ROOT = path.join(__dirname, '..');

// Simple static file server
function startServer() {
    return new Promise((resolve) => {
        const server = http.createServer((req, res) => {
            let filePath = path.join(ROOT, req.url === '/' ? 'index.html' : req.url);
            const ext = path.extname(filePath);
            const contentType = {
                '.html': 'text/html',
                '.js': 'text/javascript',
                '.css': 'text/css',
            }[ext] || 'text/plain';

            fs.readFile(filePath, (err, content) => {
                if (err) {
                    res.writeHead(404);
                    res.end('Not found');
                } else {
                    res.writeHead(200, { 'Content-Type': contentType });
                    res.end(content);
                }
            });
        });
        server.listen(PORT, () => resolve(server));
    });
}

async function runTest() {
    console.log('Starting browser test...');

    const server = await startServer();
    console.log(`✓ Server running on port ${PORT}`);

    const errors = [];
    let browser;

    try {
        browser = await chromium.launch({ headless: true });
        const page = await browser.newPage();

        // Collect console errors
        page.on('console', msg => {
            if (msg.type() === 'error') {
                errors.push(msg.text());
            }
        });

        // Collect page errors (uncaught exceptions)
        page.on('pageerror', err => {
            errors.push(err.message);
        });

        // Load the page
        console.log('Loading solar/index.html...');
        await page.goto(`http://localhost:${PORT}/solar/index.html`, {
            waitUntil: 'networkidle',
            timeout: 10000
        });

        // Wait for animation to run a bit
        await page.waitForTimeout(2000);

        // Check that canvas exists and has content
        const canvasExists = await page.$('canvas');
        if (!canvasExists) {
            errors.push('Canvas element not found');
        }

        // Check that planets are defined (run in page context)
        const planetsExist = await page.evaluate(() => {
            return typeof planets !== 'undefined' && Array.isArray(planets) && planets.length === 8;
        });
        if (!planetsExist) {
            errors.push('Planets array not properly initialized');
        }

        console.log('✓ Page loaded and running');

    } catch (err) {
        errors.push(`Browser error: ${err.message}`);
    } finally {
        if (browser) await browser.close();
        server.close();
    }

    // Report results
    if (errors.length > 0) {
        console.log('\n✗ BROWSER TEST FAILED:');
        errors.forEach(e => console.log(`  - ${e}`));
        process.exit(1);
    } else {
        console.log('✓ No JavaScript errors detected');
        console.log('✓ Browser test passed');
        process.exit(0);
    }
}

runTest().catch(err => {
    console.error('Test runner error:', err);
    process.exit(1);
});
