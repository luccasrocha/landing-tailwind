/**
 * Screenshot script — captura screenshots mobile e desktop da landing page
 * usando o Chromium do Playwright.
 */
const { chromium } = require('playwright');

(async () => {
  const browser = await chromium.launch();
  const url = 'file://' + __dirname + '/../index.html';
  const context = await browser.newContext();
  const page = await context.newPage();

  // Desktop
  await page.setViewportSize({ width: 1280, height: 900 });
  await page.goto(url, { waitUntil: 'networkidle' });
  await page.screenshot({ path: 'shots/desktop.png', fullPage: true });

  // Mobile
  await page.setViewportSize({ width: 375, height: 812 });
  await page.reload({ waitUntil: 'networkidle' });
  await page.screenshot({ path: 'shots/mobile.png', fullPage: true });

  await browser.close();
  console.log('✅ Screenshots salvas em shots/desktop.png e shots/mobile.png');
})();
