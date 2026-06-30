const fs = require('fs');
const path = require('path');

const htmlPath = path.join(__dirname, 'index.html');
let html = fs.readFileSync(htmlPath, 'utf8');

const replacements = [
  [`<div class="hero-badge">`, `<div class="hero-badge" data-i18n="hero_badge">`],
  [`<div class="gsap-hero-line">Nature's Grain,</div>`, `<div class="gsap-hero-line" data-i18n="hero_title_1">Nature's Grain,</div>`],
  [`<div class="gsap-hero-line text-gold">Nurtured for You</div>`, `<div class="gsap-hero-line text-gold" data-i18n="hero_title_2">Nurtured for You</div>`],
  [`<p class="hero-subtitle gsap-hero-line">Premium Millets, Superfoods & Spices Exported Globally from Indian Farmlands to the World.</p>`, `<p class="hero-subtitle gsap-hero-line" data-i18n="hero_subtitle">Premium Millets, Superfoods & Spices Exported Globally from Indian Farmlands to the World.</p>`],
  [`<a href="#products" class="btn btn-primary btn-glow" style="padding: 18px 45px; font-size: 1.1rem;">Explore Our Exports</a>`, `<a href="#products" class="btn btn-primary btn-glow" data-i18n="btn_explore" style="padding: 18px 45px; font-size: 1.1rem;">Explore Our Exports</a>`],
  [`<span>🟢 Recent Shipment: 200MT Premium Millets to Tokyo, Japan</span>`, `<span data-i18n="ticker_1">🟢 Recent Shipment: 200MT Premium Millets to Tokyo, Japan</span>`],
  [`<span>🟢 Quality Control: 99.99% Sortex Cleaned Batch Approved</span>`, `<span data-i18n="ticker_2">🟢 Quality Control: 99.99% Sortex Cleaned Batch Approved</span>`],
  [`<span>🟢 En Route: Container dispatch to Dubai, UAE</span>`, `<span data-i18n="ticker_3">🟢 En Route: Container dispatch to Dubai, UAE</span>`],
  [`<span>🟢 Recent Shipment: 50MT Superfoods to London, UK</span>`, `<span data-i18n="ticker_4">🟢 Recent Shipment: 50MT Superfoods to London, UK</span>`],
  [`<h2 class="section-title">Sustainable Sourcing</h2>`, `<h2 class="section-title" data-i18n="story_title_1">Sustainable Sourcing</h2>`],
  [`<p>Through partnerships with Indian farmers, we promote sustainable practices to source the finest millets, spices, and superfoods directly from nature.</p>`, `<p data-i18n="story_desc_1">Through partnerships with Indian farmers, we promote sustainable practices to source the finest millets, spices, and superfoods directly from nature.</p>`],
  [`<h2 class="section-title">Advanced Processing</h2>`, `<h2 class="section-title" data-i18n="story_title_2">Advanced Processing</h2>`],
  [`<p>Our expansive 25,000 sq ft manufacturing facility near Bangalore uses cutting-edge technology, achieving an impressive 99.99% cleanliness level.</p>`, `<p data-i18n="story_desc_2">Our expansive 25,000 sq ft manufacturing facility near Bangalore uses cutting-edge technology, achieving an impressive 99.99% cleanliness level.</p>`],
  [`<h2 class="section-title">Global Export</h2>`, `<h2 class="section-title" data-i18n="story_title_3">Global Export</h2>`],
  [`<p>As a government-recognized Star Export House, we ensure timely delivery of 100% natural, premium products to international markets.</p>`, `<p data-i18n="story_desc_3">As a government-recognized Star Export House, we ensure timely delivery of 100% natural, premium products to international markets.</p>`],
  [`<text x="40" y="-12" fill="#fff" font-size="20" font-weight="bold" font-family="var(--font-heading)">Kurnool, India</text>`, `<text x="40" y="-12" fill="#fff" font-size="20" font-weight="bold" font-family="var(--font-heading)" data-i18n="map_kurnool_title">Kurnool, India</text>`],
  [`<text x="40" y="12" fill="var(--color-secondary)" font-size="14" font-family="var(--font-body)">Global Operations Hub</text>`, `<text x="40" y="12" fill="var(--color-secondary)" font-size="14" font-family="var(--font-body)" data-i18n="map_kurnool_desc">Global Operations Hub</text>`],
  [`<h4>Tokyo, Japan</h4>`, `<h4 data-i18n="map_jp_title">Tokyo, Japan</h4>`],
  [`<p>Premium Millets<br/>Quality: Sortex 99.99%</p>`, `<p data-i18n="map_jp_desc">Premium Millets<br/>Quality: Sortex 99.99%</p>`],
  [`<h4>Dubai, UAE</h4>`, `<h4 data-i18n="map_uae_title">Dubai, UAE</h4>`],
  [`<p>Spices & Superfoods<br/>Container Dispatch</p>`, `<p data-i18n="map_uae_desc">Spices & Superfoods<br/>Container Dispatch</p>`],
  [`<h2>Get in Touch</h2>`, `<h2 data-i18n="contact_title">Get in Touch</h2>`],
  [`<p>Interested in bulk orders, exports, or have a general query? Fill out the form and our team will get back to you promptly.</p>`, `<p data-i18n="contact_desc">Interested in bulk orders, exports, or have a general query? Fill out the form and our team will get back to you promptly.</p>`]
];

for (let [search, replace] of replacements) {
  html = html.split(search).join(replace);
}

fs.writeFileSync(htmlPath, html);
console.log("HTML updated!");
