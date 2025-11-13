#!/usr/bin/env node

import { chromium } from 'playwright';
import os from "os";
import path from "path";

const url = process.argv[2];

if (!url) {
  console.error('Usage: node chromiumCapture.js <url>');
  process.exit(1);
}

(async () => {
  const browser = await chromium.launch(); // Launch browser
  const page = await browser.newPage(); // Open a new page
  await page.goto(url); // Navigate to the page

  const home = os.homedir();
  const filePath = path.join(home, "Library/Mobile Documents/com~apple~CloudDocs/Screenshots/screenshot.png");
  await page.screenshot({
    //path: '/Users/dylan/Library/Mobile Documents/com~apple~CloudDocs/Screenshots/screenshot.png',
    path: filePath,
    fullPage: true,
  }); // Take a screenshot

  await browser.close(); // Close the browser
})();
