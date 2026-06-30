
# Shared components
$HEAD = @'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="../rithwik_logo.webp" type="image/webp">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,600;0,700;1,400&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet">
  <style>
    *{box-sizing:border-box;margin:0;padding:0}
    body{font-family:'Inter',sans-serif;background:#fafaf4;color:#1a1c19;overflow-x:hidden;line-height:1.6}
    h1,h2,h3,h4,.serif{font-family:'Playfair Display',serif}
    a{text-decoration:none}
    img{display:block;max-width:100%}
    .ms{font-family:'Material Symbols Outlined';font-style:normal;font-weight:normal;
        font-variation-settings:'FILL' 0,'wght' 400,'GRAD' 0,'opsz' 24;line-height:1;display:inline-block}
    /* Buttons */
    .btn{display:inline-flex;align-items:center;gap:8px;padding:14px 32px;border-radius:50px;font-size:14px;
         font-weight:600;letter-spacing:.06em;text-transform:uppercase;transition:all .3s cubic-bezier(.16,1,.3,1);
         cursor:pointer;border:none;font-family:'Inter',sans-serif;text-decoration:none}
    .btn-green{background:#163422;color:#fff}.btn-green:hover{background:#2d4b37;transform:translateY(-2px);box-shadow:0 12px 28px -8px rgba(22,52,34,.4)}
    .btn-gold{background:#775a19;color:#fff}.btn-gold:hover{background:#5d4214;transform:translateY(-2px);box-shadow:0 12px 28px -8px rgba(119,90,25,.5)}
    .btn-outline{background:transparent;color:#163422;border:2px solid #163422}.btn-outline:hover{background:#163422;color:#fff;transform:translateY(-2px)}
    .btn-outline-light{background:transparent;color:#c8ebd0;border:2px solid rgba(200,235,208,.4)}.btn-outline-light:hover{border-color:#e9c176;color:#e9c176}
    .btn-sm{padding:10px 20px;font-size:12px}
    /* Layout */
    .container{max-width:1280px;margin:0 auto;padding:0 64px}
    .section{padding:96px 0}
    /* Cards */
    .card{background:#fff;border-radius:20px;border:1px solid rgba(22,52,34,.07);overflow:hidden;
          transition:all .5s cubic-bezier(.16,1,.3,1)}
    .card:hover{transform:translateY(-6px);box-shadow:0 24px 48px -12px rgba(22,52,34,.12)}
    /* Tags */
    .tag{display:inline-flex;align-items:center;gap:6px;padding:6px 14px;background:rgba(119,90,25,.1);
         color:#775a19;border-radius:50px;font-size:11px;font-weight:700;letter-spacing:.12em;text-transform:uppercase}
    .tag-light{background:rgba(233,193,118,.15);color:#e9c176}
    /* Reveal */
    .reveal{opacity:0;transform:translateY(28px);transition:opacity .9s cubic-bezier(.16,1,.3,1),transform .9s cubic-bezier(.16,1,.3,1)}
    .reveal.in{opacity:1;transform:none}
    /* Divider accent */
    .accent-line{width:48px;height:3px;background:linear-gradient(90deg,#775a19,#e9c176);border-radius:2px;margin:16px 0 28px}
    /* Glass */
    .glass{background:rgba(250,250,244,.88);backdrop-filter:blur(20px);-webkit-backdrop-filter:blur(20px)}
    /* Form */
    .form-group{margin-bottom:24px}
    .form-label{display:block;font-size:12px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:#424843;margin-bottom:8px}
    .form-input{width:100%;padding:14px 18px;border:1.5px solid rgba(22,52,34,.15);border-radius:12px;
                font-family:'Inter',sans-serif;font-size:15px;background:#fff;transition:all .2s;outline:none;color:#1a1c19}
    .form-input:focus{border-color:#775a19;box-shadow:0 0 0 3px rgba(119,90,25,.1)}
    textarea.form-input{resize:vertical;min-height:140px}
    select.form-input{cursor:pointer}
    /* Header */
    #site-header{position:fixed;top:0;left:0;right:0;z-index:100;transition:all .3s}
    #site-header.scrolled{padding-top:0;padding-bottom:0;box-shadow:0 2px 20px rgba(22,52,34,.08)}
    #site-header .inner{max-width:1280px;margin:0 auto;padding:22px 64px;display:flex;justify-content:space-between;align-items:center}
    #site-header.scrolled .inner{padding-top:14px;padding-bottom:14px}
    #site-header .logo{display:flex;align-items:center;gap:12px;text-decoration:none}
    #site-header .logo img{width:40px;height:40px;border-radius:50%;object-fit:cover;box-shadow:0 2px 8px rgba(22,52,34,.2)}
    #site-header .logo-name{font-family:'Playfair Display',serif;font-size:22px;font-weight:700;color:#163422}
    #desktop-nav{display:flex;align-items:center;gap:32px}
    #desktop-nav a{font-size:14px;font-weight:500;color:#424843;transition:color .2s;letter-spacing:.02em}
    #desktop-nav a:hover,#desktop-nav a.active{color:#775a19}
    #desktop-nav a.active{border-bottom:2px solid #775a19;padding-bottom:2px}
    /* Mobile menu */
    #menu-btn{display:none;background:none;border:none;cursor:pointer;color:#163422;padding:4px}
    #mobile-menu{display:none;position:fixed;inset:0;z-index:200;background:#163422;padding:100px 32px 40px;flex-direction:column;gap:0}
    #mobile-menu.open{display:flex}
    #mobile-menu a{color:rgba(200,235,208,.85);font-family:'Playfair Display',serif;font-size:26px;font-weight:600;
                   padding:16px 0;border-bottom:1px solid rgba(200,235,208,.12);transition:color .2s}
    #mobile-menu a:hover{color:#e9c176}
    #mobile-menu .close-btn{position:absolute;top:24px;right:24px;background:none;border:none;color:#c8ebd0;cursor:pointer;font-size:36px}
    /* Page hero */
    .page-hero{padding:160px 0 80px;background:linear-gradient(135deg,#163422 0%,#1e3d2b 100%);color:#c8ebd0;position:relative;overflow:hidden}
    .page-hero::before{content:'';position:absolute;inset:0;background:radial-gradient(ellipse at 70% 50%,rgba(233,193,118,.08),transparent 60%);pointer-events:none}
    /* Toast */
    #toast{position:fixed;bottom:32px;right:32px;background:#163422;color:#c8ebd0;padding:16px 24px;
           border-radius:14px;font-size:14px;z-index:999;opacity:0;transform:translateY(20px);
           transition:all .4s cubic-bezier(.16,1,.3,1);pointer-events:none;display:flex;align-items:center;gap:10px;
           box-shadow:0 8px 24px rgba(22,52,34,.3)}
    #toast.show{opacity:1;transform:none}
    /* Footer */
    .site-footer{background:#163422;color:#c8ebd0;padding:80px 0 40px}
    .site-footer .inner{max-width:1280px;margin:0 auto;padding:0 64px}
    .footer-grid{display:grid;grid-template-columns:2fr 1fr 1fr 1.5fr;gap:60px;margin-bottom:60px}
    .footer-logo{display:flex;align-items:center;gap:12px;margin-bottom:20px}
    .footer-logo img{width:48px;height:48px;border-radius:50%;object-fit:cover}
    .footer-logo span{font-family:'Playfair Display',serif;font-size:26px;font-weight:700;color:#c8ebd0}
    .footer-desc{font-size:14px;line-height:1.75;color:rgba(200,235,208,.65);max-width:280px;margin-bottom:24px}
    .footer-map{border-radius:12px;overflow:hidden;border:1px solid rgba(200,235,208,.12)}
    .footer-col-title{font-size:11px;font-weight:700;letter-spacing:.15em;text-transform:uppercase;color:#e9c176;margin-bottom:20px}
    .footer-links{display:flex;flex-direction:column;gap:12px}
    .footer-links a{color:rgba(200,235,208,.75);font-size:14px;transition:color .2s}
    .footer-links a:hover{color:#e9c176}
    .footer-contact-item{display:flex;align-items:flex-start;gap:10px;color:rgba(200,235,208,.75);font-size:14px;line-height:1.5;margin-bottom:14px}
    .footer-contact-item a{color:rgba(200,235,208,.75);transition:color .2s}.footer-contact-item a:hover{color:#e9c176}
    .footer-bar{border-top:1px solid rgba(200,235,208,.12);padding-top:32px;display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:12px}
    .footer-bar p{font-size:13px;color:rgba(200,235,208,.45)}
    /* Responsive */
    @media(max-width:900px){
      .container{padding:0 20px}
      #site-header .inner{padding:16px 20px}
      #desktop-nav{display:none}
      #menu-btn{display:block}
      .footer-grid{grid-template-columns:1fr}
      .site-footer .inner{padding:0 20px}
      .section{padding:64px 0}
    }
  </style>
</head>
<body>
'@

$NAV = @'
<header id="site-header" class="glass">
  <div class="inner">
    <a href="index.html" class="logo">
      <img src="../rithwik_logo.webp" alt="Rithwik Logo">
      <span class="logo-name">Rithwik</span>
    </a>
    <nav id="desktop-nav">
      <a href="index.html" data-page="index">Superfoods</a>
      <a href="millets.html" data-page="millets">Millets</a>
      <a href="products.html" data-page="products">Bird Feeds</a>
      <a href="about.html" data-page="about">Our Heritage</a>
      <a href="quality.html" data-page="quality">Quality</a>
      <a href="wholesale.html" class="btn btn-gold btn-sm" data-page="wholesale">Get a Quote</a>
    </nav>
    <button id="menu-btn" onclick="document.getElementById('mobile-menu').classList.toggle('open')">
      <span class="ms" style="font-size:28px">menu</span>
    </button>
  </div>
</header>
<div id="mobile-menu">
  <button class="close-btn ms" onclick="document.getElementById('mobile-menu').classList.remove('open')">close</button>
  <a href="index.html" onclick="this.closest('#mobile-menu').classList.remove('open')">Superfoods</a>
  <a href="millets.html" onclick="this.closest('#mobile-menu').classList.remove('open')">Millets</a>
  <a href="products.html" onclick="this.closest('#mobile-menu').classList.remove('open')">Bird Feeds</a>
  <a href="about.html" onclick="this.closest('#mobile-menu').classList.remove('open')">Our Heritage</a>
  <a href="quality.html" onclick="this.closest('#mobile-menu').classList.remove('open')">Quality</a>
  <a href="wholesale.html" style="color:#e9c176" onclick="this.closest('#mobile-menu').classList.remove('open')">Get a Quote</a>
</div>
'@

$FOOTER = @'
<footer class="site-footer">
  <div class="inner">
    <div class="footer-grid">
      <div>
        <a href="index.html" class="footer-logo">
          <img src="../rithwik_logo.webp" alt="Rithwik Logo">
          <span>Rithwik</span>
        </a>
        <p class="footer-desc">Nature's Grain, Nurtured for You. Premium organic superfoods and bird feeds from the heart of Andhra Pradesh, India.</p>
        <div class="footer-map">
          <iframe src="https://maps.google.com/maps?q=Nandyal+Checkpost,+Kurnool,+Andhra+Pradesh&t=&z=14&ie=UTF8&iwloc=&output=embed" width="100%" height="180" style="border:0;display:block" allowfullscreen loading="lazy"></iframe>
        </div>
      </div>
      <div>
        <p class="footer-col-title">Company</p>
        <div class="footer-links">
          <a href="about.html">Our Heritage</a>
          <a href="quality.html">Quality Standards</a>
          <a href="wholesale.html">Wholesale</a>
          <a href="../index.html">Classic Site</a>
        </div>
      </div>
      <div>
        <p class="footer-col-title">Products</p>
        <div class="footer-links">
          <a href="millets.html">Premium Millets</a>
          <a href="products.html">Bird Feed Blends</a>
          <a href="index.html">Organic Seeds</a>
          <a href="wholesale.html">Bulk Orders</a>
        </div>
      </div>
      <div>
        <p class="footer-col-title">Contact</p>
        <div class="footer-contact-item"><span class="ms" style="color:#e9c176;font-size:20px;flex-shrink:0">mail</span><a href="mailto:rithwikindustries@gmail.com">rithwikindustries@gmail.com</a></div>
        <div class="footer-contact-item"><span class="ms" style="color:#e9c176;font-size:20px;flex-shrink:0">call</span><a href="tel:+918309782770">+91 8309782770</a></div>
        <div class="footer-contact-item"><span class="ms" style="color:#e9c176;font-size:20px;flex-shrink:0;margin-top:2px">location_on</span><span>87/1404, Near Nandyal Checkpost, Kurnool, AP 518002</span></div>
        <a href="wholesale.html" class="btn btn-gold btn-sm" style="margin-top:12px">Send Enquiry</a>
      </div>
    </div>
    <div class="footer-bar">
      <p>&copy; 2026 Rithwik Industries. All Rights Reserved.</p>
      <p>A <a href="https://quantumpixel.duckdns.org" target="_blank" style="color:#e9c176;font-weight:600" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='none'">QuantumPixel</a> product</p>
    </div>
  </div>
</footer>
<div id="toast"><span class="ms">check_circle</span><span id="toast-msg">Done!</span></div>
<script>
// Reveal on scroll
const rio=new IntersectionObserver(es=>es.forEach(e=>{if(e.isIntersecting){e.target.classList.add('in');rio.unobserve(e.target)}}),{threshold:.08,rootMargin:'0px 0px -30px 0px'});
document.querySelectorAll('.reveal').forEach(el=>rio.observe(el));
// Header scroll
window.addEventListener('scroll',()=>document.getElementById('site-header').classList.toggle('scrolled',scrollY>40),{passive:true});
// Active nav link
const pg=location.pathname.split('/').pop().replace('.html','')||'index';
document.querySelectorAll('[data-page]').forEach(a=>{if(a.dataset.page===pg)a.classList.add('active')});
// Toast
function showToast(msg,icon='check_circle'){
  const t=document.getElementById('toast');
  document.getElementById('toast-msg').textContent=msg;
  t.querySelector('.ms').textContent=icon;
  t.classList.add('show');
  setTimeout(()=>t.classList.remove('show'),3200);
}
// Mobile menu responsive
const mq=matchMedia('(max-width:900px)');
const applyMQ=()=>{document.getElementById('menu-btn').style.display=mq.matches?'block':'none'};
applyMQ();mq.addListener(applyMQ);
</script>
</body></html>
'@

# ── INDEX ──────────────────────────────────────────────────────
$INDEX = $HEAD + @'
<title>Rithwik Industries — Organic Superfoods &amp; Bird Feeds</title>
<meta name="description" content="Premium organic millets, superfoods, seeds and bird feeds from Andhra Pradesh, exported globally.">
</head>
'@ + $NAV + @'
<!-- HERO -->
<section style="display:grid;grid-template-columns:1fr 1fr;min-height:100vh">
  <div style="background:linear-gradient(150deg,#fafaf4,#eef5f0);display:flex;flex-direction:column;justify-content:center;padding:160px 64px 80px;position:relative;overflow:hidden">
    <div style="position:absolute;top:-100px;right:-100px;width:500px;height:500px;border-radius:50%;background:radial-gradient(circle,rgba(119,90,25,.06),transparent 70%);pointer-events:none"></div>
    <div class="reveal"><span class="tag">Rithwik Industries</span></div>
    <div class="accent-line reveal"></div>
    <h1 class="reveal" style="font-size:clamp(44px,6vw,76px);line-height:1.1;color:#163422;margin-bottom:24px">Organic<br><em style="color:#775a19;font-style:italic">Superfoods</em></h1>
    <p class="reveal" style="font-size:17px;line-height:1.75;color:#424843;max-width:400px;margin-bottom:40px">Nature's Grain, Nurtured for You. Premium millets, seeds and spices from Andhra Pradesh's heartland.</p>
    <div class="reveal" style="display:flex;gap:16px;flex-wrap:wrap">
      <a href="millets.html" class="btn btn-green">Explore Millets <span class="ms">arrow_forward</span></a>
      <a href="wholesale.html" class="btn btn-outline">Get a Quote</a>
    </div>
    <div class="reveal" style="display:flex;gap:48px;margin-top:60px;padding-top:40px;border-top:1px solid rgba(22,52,34,.1)">
      <div><p style="font-family:'Playfair Display',serif;font-size:40px;font-weight:700;color:#163422">20+</p><p style="font-size:12px;color:#424843;text-transform:uppercase;letter-spacing:.12em;margin-top:4px">Products</p></div>
      <div><p style="font-family:'Playfair Display',serif;font-size:40px;font-weight:700;color:#163422">99.9%</p><p style="font-size:12px;color:#424843;text-transform:uppercase;letter-spacing:.12em;margin-top:4px">Purity</p></div>
      <div><p style="font-family:'Playfair Display',serif;font-size:40px;font-weight:700;color:#163422">Global</p><p style="font-size:12px;color:#424843;text-transform:uppercase;letter-spacing:.12em;margin-top:4px">Exports</p></div>
    </div>
  </div>
  <div style="background:linear-gradient(150deg,#163422,#0d1f16);display:flex;flex-direction:column;justify-content:center;padding:160px 64px 80px;position:relative;overflow:hidden">
    <div style="position:absolute;bottom:-60px;right:-60px;width:400px;height:400px;border-radius:50%;background:radial-gradient(circle,rgba(233,193,118,.08),transparent 70%);pointer-events:none"></div>
    <div class="reveal"><span class="tag tag-light">Bird Feeds</span></div>
    <div class="accent-line reveal" style="background:linear-gradient(90deg,#e9c176,#fed488)"></div>
    <h1 class="reveal" style="font-size:clamp(44px,6vw,76px);line-height:1.1;color:#c8ebd0;margin-bottom:24px">Premium<br><em style="color:#e9c176;font-style:italic">Nutrition</em></h1>
    <p class="reveal" style="font-size:17px;line-height:1.75;color:rgba(200,235,208,.7);max-width:400px;margin-bottom:40px">Scientifically formulated blends for optimal avian health. Sourced from the finest origins, trusted by breeders worldwide.</p>
    <div class="reveal" style="display:flex;gap:16px;flex-wrap:wrap">
      <a href="products.html" class="btn btn-gold">View Blends <span class="ms">arrow_forward</span></a>
      <a href="wholesale.html" class="btn btn-outline-light">Wholesale Enquiry</a>
    </div>
  </div>
</section>

<!-- TRUST BAR -->
<section class="reveal" style="background:#fff;border-top:1px solid rgba(22,52,34,.06);border-bottom:1px solid rgba(22,52,34,.06);padding:36px 0">
  <div class="container" style="display:flex;justify-content:space-around;align-items:center;flex-wrap:wrap;gap:24px">
    <div style="display:flex;align-items:center;gap:14px"><span class="ms" style="font-size:30px;color:#775a19">workspace_premium</span><div><p style="font-size:15px;font-weight:600;color:#163422">Star Export House</p><p style="font-size:12px;color:#424843">Govt. Recognized</p></div></div>
    <div style="width:1px;height:40px;background:rgba(22,52,34,.1)"></div>
    <div style="display:flex;align-items:center;gap:14px"><span class="ms" style="font-size:30px;color:#775a19">verified</span><div><p style="font-size:15px;font-weight:600;color:#163422">BRC &amp; USFDA Certified</p><p style="font-size:12px;color:#424843">International Standards</p></div></div>
    <div style="width:1px;height:40px;background:rgba(22,52,34,.1)"></div>
    <div style="display:flex;align-items:center;gap:14px"><span class="ms" style="font-size:30px;color:#775a19">agriculture</span><div><p style="font-size:15px;font-weight:600;color:#163422">Farm-Direct Sourcing</p><p style="font-size:12px;color:#424843">Andhra Pradesh</p></div></div>
    <div style="width:1px;height:40px;background:rgba(22,52,34,.1)"></div>
    <div style="display:flex;align-items:center;gap:14px"><span class="ms" style="font-size:30px;color:#775a19">public</span><div><p style="font-size:15px;font-weight:600;color:#163422">Global Exports</p><p style="font-size:12px;color:#424843">Worldwide Delivery</p></div></div>
  </div>
</section>

<!-- PRODUCTS GRID -->
<section class="section">
  <div class="container">
    <div class="reveal" style="text-align:center;margin-bottom:64px">
      <span class="tag">Our Collections</span>
      <h2 style="font-size:52px;color:#163422;margin:20px 0 16px">Line of Products</h2>
      <p style="font-size:17px;color:#424843;max-width:560px;margin:0 auto;line-height:1.75">Millets, superseeds, superfoods, spices and nuts — processed with absolute care and exported globally.</p>
    </div>
    <div style="display:grid;grid-template-columns:2fr 1fr;gap:20px;margin-bottom:20px">
      <!-- Millets big -->
      <div class="card reveal" style="display:flex;overflow:hidden">
        <div style="padding:48px;flex:1">
          <span class="tag" style="margin-bottom:16px">Core Category</span>
          <h3 style="font-size:40px;color:#163422;margin:16px 0 20px">Premium Millets</h3>
          <div style="display:grid;grid-template-columns:1fr 1fr;gap:8px 20px;margin-bottom:28px">
            <span style="font-size:14px;color:#424843;display:flex;align-items:center;gap:8px"><span class="ms" style="color:#775a19;font-size:16px">spa</span>Foxtail Millet</span>
            <span style="font-size:14px;color:#424843;display:flex;align-items:center;gap:8px"><span class="ms" style="color:#775a19;font-size:16px">spa</span>Kodo Millet</span>
            <span style="font-size:14px;color:#424843;display:flex;align-items:center;gap:8px"><span class="ms" style="color:#775a19;font-size:16px">spa</span>Proso Millet</span>
            <span style="font-size:14px;color:#424843;display:flex;align-items:center;gap:8px"><span class="ms" style="color:#775a19;font-size:16px">spa</span>Browntop Millet</span>
            <span style="font-size:14px;color:#424843;display:flex;align-items:center;gap:8px"><span class="ms" style="color:#775a19;font-size:16px">spa</span>Barnyard Millet</span>
            <span style="font-size:14px;color:#424843;display:flex;align-items:center;gap:8px"><span class="ms" style="color:#775a19;font-size:16px">spa</span>Little Millet</span>
          </div>
          <div style="background:#f4f4ee;padding:18px;border-radius:12px;margin-bottom:32px">
            <p style="font-size:11px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:#775a19;margin-bottom:6px">Health Benefits</p>
            <p style="font-size:14px;color:#424843;line-height:1.6">Rich in fiber, antioxidants and essential nutrients. Gluten-free, great for weight management and digestive health.</p>
          </div>
          <a href="millets.html" class="btn btn-green">Explore Millets <span class="ms">arrow_forward</span></a>
        </div>
        <div style="width:280px;flex-shrink:0;position:relative;overflow:hidden">
          <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDwmEteuyo5gdxv-KCLfDVoMysAGr5oRAMO4qYNFSQZhOGy3Zb8rYw_Uoj3Vr29kUNn-RasGR1iQLAs07RTgDgNEog93bBpCp7sagWn6IjsMThCYqPGXXZd4_Amq-zwULLdZCyNobTmpxMnQwG9wYFx7WRB01H7FdKL3w1eT7Sh0pwzH7ng_9zvZxJHm2CtbkVvq7yDr7UjVijkiitHqEikp3GZVMjvgV8Gu82H2m8YnXRKXeKR19AeBYX0mf-qiAwS-S0Apmt-JHA" alt="Premium Millets" style="width:100%;height:100%;object-fit:cover;position:absolute;inset:0;transition:transform .6s" onmouseover="this.style.transform='scale(1.06)'" onmouseout="this.style.transform='scale(1)'">
        </div>
      </div>
      <!-- Seeds dark -->
      <div class="reveal" style="background:linear-gradient(145deg,#2d4b37,#163422);border-radius:20px;padding:48px;display:flex;flex-direction:column;justify-content:space-between">
        <div>
          <span class="ms" style="font-size:48px;color:rgba(233,193,118,.25)">local_florist</span>
          <h3 style="font-size:36px;color:#c8ebd0;margin:16px 0 24px;line-height:1.2">Seeds &amp;<br>Superfoods</h3>
          <ul style="list-style:none;display:flex;flex-direction:column;gap:10px;margin-bottom:32px">
            <li style="display:flex;align-items:center;gap:10px;color:rgba(200,235,208,.85);font-size:14px"><span style="width:6px;height:6px;border-radius:50%;background:#e9c176;flex-shrink:0"></span>Pumpkin Seeds</li>
            <li style="display:flex;align-items:center;gap:10px;color:rgba(200,235,208,.85);font-size:14px"><span style="width:6px;height:6px;border-radius:50%;background:#e9c176;flex-shrink:0"></span>Sunflower Seeds</li>
            <li style="display:flex;align-items:center;gap:10px;color:rgba(200,235,208,.85);font-size:14px"><span style="width:6px;height:6px;border-radius:50%;background:#e9c176;flex-shrink:0"></span>Flax &amp; Chia Seeds</li>
            <li style="display:flex;align-items:center;gap:10px;color:rgba(200,235,208,.85);font-size:14px"><span style="width:6px;height:6px;border-radius:50%;background:#e9c176;flex-shrink:0"></span>Sesame &amp; Quinoa</li>
            <li style="display:flex;align-items:center;gap:10px;color:rgba(200,235,208,.85);font-size:14px"><span style="width:6px;height:6px;border-radius:50%;background:#e9c176;flex-shrink:0"></span>Safflower Seeds</li>
          </ul>
        </div>
        <a href="products.html" class="btn btn-gold">View All Seeds <span class="ms">arrow_forward</span></a>
      </div>
    </div>
    <div style="display:grid;grid-template-columns:1fr 1fr 1fr;gap:20px">
      <div class="card reveal" style="padding:36px;text-align:center">
        <span class="ms" style="font-size:40px;color:#775a19;margin-bottom:16px;display:block">grass</span>
        <h4 style="font-size:22px;color:#163422;margin-bottom:12px">Bird Feed Blends</h4>
        <p style="font-size:14px;color:#424843;line-height:1.65;margin-bottom:24px">Scientifically formulated nutrition blends for avian companions.</p>
        <a href="products.html" class="btn btn-outline btn-sm">Explore</a>
      </div>
      <div class="card reveal" style="padding:36px;text-align:center">
        <span class="ms" style="font-size:40px;color:#775a19;margin-bottom:16px;display:block">local_fire_department</span>
        <h4 style="font-size:22px;color:#163422;margin-bottom:12px">Spices &amp; Nuts</h4>
        <p style="font-size:14px;color:#424843;line-height:1.65;margin-bottom:24px">Premium quality spices and nuts sourced directly from farms.</p>
        <a href="products.html" class="btn btn-outline btn-sm">Explore</a>
      </div>
      <div class="reveal" style="background:linear-gradient(135deg,#775a19,#5d4214);border-radius:20px;padding:36px;text-align:center">
        <span class="ms" style="font-size:40px;color:#e9c176;margin-bottom:16px;display:block">inventory</span>
        <h4 style="font-size:22px;color:#fff;margin-bottom:12px">Bulk Orders</h4>
        <p style="font-size:14px;color:rgba(255,255,255,.8);line-height:1.65;margin-bottom:24px">Competitive pricing for wholesale &amp; export quantities.</p>
        <a href="wholesale.html" style="display:inline-flex;align-items:center;gap:8px;background:#fff;color:#775a19;padding:10px 20px;border-radius:50px;font-size:12px;font-weight:700;letter-spacing:.06em;text-transform:uppercase;transition:all .2s" onmouseover="this.style.background='#e9c176'" onmouseout="this.style.background='#fff'">Get a Quote <span class="ms">east</span></a>
      </div>
    </div>
  </div>
</section>

<!-- WHY US -->
<section class="section reveal" style="background:#fff">
  <div class="container">
    <div style="text-align:center;margin-bottom:64px">
      <span class="tag">Why Choose Us</span>
      <h2 style="font-size:48px;color:#163422;margin:20px 0 16px">Why Rithwik Industries</h2>
      <p style="font-size:17px;color:#424843;max-width:520px;margin:0 auto;line-height:1.75">We strive for excellence through quality, reliability and positive industry impact.</p>
    </div>
    <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:24px">
      <div class="card reveal" style="padding:36px">
        <span class="ms" style="font-size:36px;color:#775a19;margin-bottom:16px;display:block">workspace_premium</span>
        <h4 style="font-size:19px;color:#163422;margin-bottom:10px">Star Export House</h4>
        <p style="font-size:14px;color:#424843;line-height:1.65">Govt-recognized status ensures credibility and excellence in all export operations worldwide.</p>
      </div>
      <div class="card reveal" style="padding:36px">
        <span class="ms" style="font-size:36px;color:#775a19;margin-bottom:16px;display:block">verified</span>
        <h4 style="font-size:19px;color:#163422;margin-bottom:10px">Superior Quality</h4>
        <p style="font-size:14px;color:#424843;line-height:1.65">Products consistently meet international standards with multi-stage cleaning ensuring 99.9% purity.</p>
      </div>
      <div class="card reveal" style="padding:36px">
        <span class="ms" style="font-size:36px;color:#775a19;margin-bottom:16px;display:block">local_shipping</span>
        <h4 style="font-size:19px;color:#163422;margin-bottom:10px">Timely Delivery</h4>
        <p style="font-size:14px;color:#424843;line-height:1.65">We prioritize prompt delivery ensuring orders reach clients on time without compromising freshness.</p>
      </div>
      <div class="card reveal" style="padding:36px">
        <span class="ms" style="font-size:36px;color:#775a19;margin-bottom:16px;display:block">security</span>
        <h4 style="font-size:19px;color:#163422;margin-bottom:10px">Quality Assurance</h4>
        <p style="font-size:14px;color:#424843;line-height:1.65">BRC, USFDA, and multiple international certifications back our unwavering commitment to quality.</p>
      </div>
      <div class="card reveal" style="padding:36px">
        <span class="ms" style="font-size:36px;color:#775a19;margin-bottom:16px;display:block">price_check</span>
        <h4 style="font-size:19px;color:#163422;margin-bottom:10px">Competitive Pricing</h4>
        <p style="font-size:14px;color:#424843;line-height:1.65">Excellent value for money making us an attractive choice for clients worldwide across all segments.</p>
      </div>
      <div class="card reveal" style="padding:36px">
        <span class="ms" style="font-size:36px;color:#775a19;margin-bottom:16px;display:block">public</span>
        <h4 style="font-size:19px;color:#163422;margin-bottom:10px">Global Reach</h4>
        <p style="font-size:14px;color:#424843;line-height:1.65">Expanding footprint across continents to bring premium agricultural products to international markets.</p>
      </div>
    </div>
  </div>
</section>

<!-- CTA BANNER -->
<section class="reveal" style="background:linear-gradient(135deg,#163422,#2d4b37);padding:96px 0;text-align:center;position:relative;overflow:hidden">
  <div style="position:absolute;inset:0;background:radial-gradient(ellipse at center,rgba(233,193,118,.07),transparent 65%);pointer-events:none"></div>
  <div class="container" style="position:relative;z-index:1">
    <span class="tag tag-light reveal">Start Today</span>
    <h2 style="font-size:52px;color:#c8ebd0;margin:20px 0 16px;font-style:italic">Ready to Partner With Us?</h2>
    <p style="font-size:17px;color:rgba(200,235,208,.7);max-width:500px;margin:0 auto 40px;line-height:1.75">Fill out our wholesale enquiry and our team responds within 24 hours with pricing and availability.</p>
    <div style="display:flex;gap:16px;justify-content:center;flex-wrap:wrap">
      <a href="wholesale.html" class="btn btn-gold">Send Enquiry <span class="ms">send</span></a>
      <a href="mailto:rithwikindustries@gmail.com" class="btn btn-outline-light"><span class="ms">mail</span> Email Us</a>
    </div>
  </div>
</section>
'@ + $FOOTER

# ── WHOLESALE / ENQUIRY ────────────────────────────────────────
$WHOLESALE = $HEAD + @'
<title>Wholesale &amp; Bulk Enquiry — Rithwik Industries</title>
<meta name="description" content="Submit a wholesale or bulk order enquiry to Rithwik Industries. We respond within 24 hours.">
</head>
'@ + $NAV + @'
<!-- PAGE HERO -->
<section class="page-hero">
  <div class="container">
    <div class="reveal"><span class="tag tag-light">Wholesale &amp; Bulk</span></div>
    <div class="accent-line reveal" style="background:linear-gradient(90deg,#e9c176,#fed488)"></div>
    <h1 class="reveal" style="font-size:clamp(40px,5vw,68px);color:#c8ebd0;line-height:1.15;margin-bottom:20px">Bulk &amp; Wholesale<br><em style="color:#e9c176">Enquiries</em></h1>
    <p class="reveal" style="font-size:17px;color:rgba(200,235,208,.7);max-width:480px;line-height:1.75">Interested in bulk orders, exports, or have a general query? Fill out the form and we will get back to you promptly.</p>
  </div>
</section>

<!-- FORM + INFO -->
<section class="section">
  <div class="container">
    <div style="display:grid;grid-template-columns:1fr 1.3fr;gap:80px;align-items:start">
      <!-- Info -->
      <div class="reveal">
        <h2 style="font-size:36px;color:#163422;margin-bottom:20px">Get in Touch</h2>
        <p style="font-size:15px;color:#424843;line-height:1.75;margin-bottom:40px">We work with wholesalers, importers, and distributors globally. Our team ensures competitive pricing, reliable quality, and timely delivery.</p>
        <div style="display:flex;flex-direction:column;gap:24px;margin-bottom:40px">
          <div style="display:flex;align-items:center;gap:16px">
            <div style="width:48px;height:48px;border-radius:50%;background:rgba(119,90,25,.1);display:flex;align-items:center;justify-content:center;flex-shrink:0"><span class="ms" style="color:#775a19;font-size:24px">mail</span></div>
            <div><p style="font-size:12px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:#775a19;margin-bottom:4px">Email</p><a href="mailto:rithwikindustries@gmail.com" style="font-size:15px;color:#163422">rithwikindustries@gmail.com</a></div>
          </div>
          <div style="display:flex;align-items:center;gap:16px">
            <div style="width:48px;height:48px;border-radius:50%;background:rgba(119,90,25,.1);display:flex;align-items:center;justify-content:center;flex-shrink:0"><span class="ms" style="color:#775a19;font-size:24px">call</span></div>
            <div><p style="font-size:12px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:#775a19;margin-bottom:4px">Phone</p><a href="tel:+918309782770" style="font-size:15px;color:#163422">+91 8309782770</a></div>
          </div>
          <div style="display:flex;align-items:flex-start;gap:16px">
            <div style="width:48px;height:48px;border-radius:50%;background:rgba(119,90,25,.1);display:flex;align-items:center;justify-content:center;flex-shrink:0;margin-top:4px"><span class="ms" style="color:#775a19;font-size:24px">location_on</span></div>
            <div><p style="font-size:12px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:#775a19;margin-bottom:4px">Office</p><p style="font-size:15px;color:#163422;line-height:1.6">87/1404, Near Nandyal Checkpost,<br>Kurnool, Andhra Pradesh 518002</p></div>
          </div>
        </div>
        <div style="background:#f4f4ee;border-radius:16px;padding:24px">
          <p style="font-size:12px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:#775a19;margin-bottom:8px">GSTIN</p>
          <p style="font-family:'Playfair Display',serif;font-size:20px;font-weight:600;color:#163422;letter-spacing:.06em">37ABKFR7391G1ZM</p>
        </div>
      </div>
      <!-- Form -->
      <div class="card reveal" style="padding:48px">
        <h3 style="font-size:28px;color:#163422;margin-bottom:32px">Send Your Enquiry</h3>
        <form id="enquiry-form" onsubmit="handleSubmit(event)">
          <div style="display:grid;grid-template-columns:1fr 1fr;gap:20px">
            <div class="form-group">
              <label class="form-label" for="name">Full Name *</label>
              <input class="form-input" type="text" id="name" name="name" required placeholder="John Smith">
            </div>
            <div class="form-group">
              <label class="form-label" for="company">Company Name</label>
              <input class="form-input" type="text" id="company" name="company" placeholder="Your Company Ltd.">
            </div>
          </div>
          <div style="display:grid;grid-template-columns:1fr 1fr;gap:20px">
            <div class="form-group">
              <label class="form-label" for="email">Email Address *</label>
              <input class="form-input" type="email" id="email" name="email" required placeholder="john@example.com">
            </div>
            <div class="form-group">
              <label class="form-label" for="phone">Phone Number</label>
              <input class="form-input" type="tel" id="phone" name="phone" placeholder="+1 234 567 8900">
            </div>
          </div>
          <div class="form-group">
            <label class="form-label" for="country">Country</label>
            <select class="form-input" id="country" name="country">
              <option value="">Select your country</option>
              <option>United States</option><option>United Kingdom</option><option>Germany</option>
              <option>Australia</option><option>Canada</option><option>UAE</option><option>Singapore</option>
              <option>Japan</option><option>India</option><option>Other</option>
            </select>
          </div>
          <div class="form-group">
            <label class="form-label" for="product">Product Interest *</label>
            <select class="form-input" id="product" name="product" required>
              <option value="">Select a product category</option>
              <option>Premium Millets (Foxtail, Kodo, Proso, etc.)</option>
              <option>Organic Seeds (Pumpkin, Sunflower, Flax, etc.)</option>
              <option>Bird Feed Blends</option>
              <option>Spices &amp; Nuts</option>
              <option>Mixed / Multiple Categories</option>
            </select>
          </div>
          <div class="form-group">
            <label class="form-label" for="quantity">Estimated Quantity</label>
            <select class="form-input" id="quantity" name="quantity">
              <option value="">Select quantity range</option>
              <option>Under 1 MT</option><option>1 - 5 MT</option><option>5 - 20 MT</option>
              <option>20 - 100 MT</option><option>100+ MT</option>
            </select>
          </div>
          <div class="form-group">
            <label class="form-label" for="message">Message</label>
            <textarea class="form-input" id="message" name="message" placeholder="Tell us about your requirements, specific varieties, packaging preferences, or any questions..."></textarea>
          </div>
          <button type="submit" class="btn btn-green" id="submit-btn" style="width:100%;justify-content:center;font-size:15px;padding:16px">
            <span id="btn-text"><span class="ms">send</span> Send Enquiry</span>
            <span id="btn-loading" style="display:none"><span class="ms" style="animation:spin .8s linear infinite">progress_activity</span> Sending...</span>
          </button>
        </form>
      </div>
    </div>
  </div>
</section>
<style>@keyframes spin{to{transform:rotate(360deg)}}</style>
<script>
function handleSubmit(e){
  e.preventDefault();
  const btn=document.getElementById('submit-btn');
  const name=document.getElementById('name').value;
  document.getElementById('btn-text').style.display='none';
  document.getElementById('btn-loading').style.display='flex';
  btn.disabled=true;
  setTimeout(()=>{
    btn.disabled=false;
    document.getElementById('btn-text').style.display='flex';
    document.getElementById('btn-loading').style.display='none';
    document.getElementById('enquiry-form').reset();
    showToast('Enquiry sent! We will contact you within 24 hours.');
  },1800);
}
</script>
'@ + $FOOTER

# ── ABOUT ──────────────────────────────────────────────────────
$ABOUT = $HEAD + @'
<title>Our Heritage — Rithwik Industries</title>
<meta name="description" content="Discover the story and heritage of Rithwik Industries — from Kurnool's agricultural heartland to global markets.">
</head>
'@ + $NAV + @'
<section class="page-hero">
  <div class="container">
    <div class="reveal"><span class="tag tag-light">Our Story</span></div>
    <div class="accent-line reveal" style="background:linear-gradient(90deg,#e9c176,#fed488)"></div>
    <h1 class="reveal" style="font-size:clamp(40px,5vw,68px);color:#c8ebd0;line-height:1.15;margin-bottom:20px">Kurnool's Legacy,<br><em style="color:#e9c176">Global Standards</em></h1>
    <p class="reveal" style="font-size:17px;color:rgba(200,235,208,.7);max-width:520px;line-height:1.75">Rooted in Andhra Pradesh's agricultural heartland, Rithwik Industries blends ancestral grain wisdom with modern precision processing to deliver purity at a global scale.</p>
  </div>
</section>
<section class="section">
  <div class="container">
    <div style="display:grid;grid-template-columns:1fr 1fr;gap:80px;align-items:center;margin-bottom:96px">
      <div class="reveal">
        <span class="tag">Our Roots</span>
        <h2 style="font-size:44px;color:#163422;margin:20px 0 20px;line-height:1.2">Farm-to-Export Excellence</h2>
        <p style="font-size:16px;color:#424843;line-height:1.8;margin-bottom:24px">Founded in the fertile lands of Kurnool, Andhra Pradesh, Rithwik Industries was established with a singular vision: to bring the purest, most nutritious grains from Indian farms to tables around the world.</p>
        <p style="font-size:16px;color:#424843;line-height:1.8;margin-bottom:32px">Our 25,000 sq ft state-of-the-art manufacturing facility near Bangalore employs cutting-edge technology achieving an impressive 99.99% cleanliness level across all product categories.</p>
        <div style="display:grid;grid-template-columns:1fr 1fr;gap:24px">
          <div style="background:#f4f4ee;border-radius:16px;padding:24px;text-align:center">
            <p style="font-family:'Playfair Display',serif;font-size:40px;font-weight:700;color:#163422">25k</p>
            <p style="font-size:13px;color:#424843;text-transform:uppercase;letter-spacing:.1em;margin-top:4px">Sq. Ft. Facility</p>
          </div>
          <div style="background:#f4f4ee;border-radius:16px;padding:24px;text-align:center">
            <p style="font-family:'Playfair Display',serif;font-size:40px;font-weight:700;color:#163422">99.9%</p>
            <p style="font-size:13px;color:#424843;text-transform:uppercase;letter-spacing:.1em;margin-top:4px">Purity Level</p>
          </div>
        </div>
      </div>
      <div class="reveal" style="position:relative;height:520px;border-radius:24px;overflow:hidden;box-shadow:0 40px 80px -20px rgba(22,52,34,.2)">
        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDwmEteuyo5gdxv-KCLfDVoMysAGr5oRAMO4qYNFSQZhOGy3Zb8rYw_Uoj3Vr29kUNn-RasGR1iQLAs07RTgDgNEog93bBpCp7sagWn6IjsMThCYqPGXXZd4_Amq-zwULLdZCyNobTmpxMnQwG9wYFx7WRB01H7FdKL3w1eT7Sh0pwzH7ng_9zvZxJHm2CtbkVvq7yDr7UjVijkiitHqEikp3GZVMjvgV8Gu82H2m8YnXRKXeKR19AeBYX0mf-qiAwS-S0Apmt-JHA" alt="Rithwik Farm" style="width:100%;height:100%;object-fit:cover">
      </div>
    </div>
    <!-- Journey Steps -->
    <div class="reveal" style="text-align:center;margin-bottom:64px">
      <span class="tag">Our Process</span>
      <h2 style="font-size:44px;color:#163422;margin:20px 0">Farm to Export Journey</h2>
    </div>
    <div style="display:grid;grid-template-columns:repeat(4,1fr);gap:32px">
      <div class="card reveal" style="padding:32px;text-align:center">
        <div style="width:64px;height:64px;border-radius:50%;background:rgba(119,90,25,.1);display:flex;align-items:center;justify-content:center;margin:0 auto 20px"><span class="ms" style="font-size:32px;color:#775a19">agriculture</span></div>
        <div style="font-size:11px;font-weight:700;letter-spacing:.15em;text-transform:uppercase;color:#775a19;margin-bottom:8px">Step 01</div>
        <h4 style="font-size:19px;color:#163422;margin-bottom:10px">Sustainable Sourcing</h4>
        <p style="font-size:14px;color:#424843;line-height:1.65">Direct partnerships with Andhra Pradesh farmers ensuring fair prices and sustainable practices.</p>
      </div>
      <div class="card reveal" style="padding:32px;text-align:center">
        <div style="width:64px;height:64px;border-radius:50%;background:rgba(119,90,25,.1);display:flex;align-items:center;justify-content:center;margin:0 auto 20px"><span class="ms" style="font-size:32px;color:#775a19">factory</span></div>
        <div style="font-size:11px;font-weight:700;letter-spacing:.15em;text-transform:uppercase;color:#775a19;margin-bottom:8px">Step 02</div>
        <h4 style="font-size:19px;color:#163422;margin-bottom:10px">Advanced Processing</h4>
        <p style="font-size:14px;color:#424843;line-height:1.65">25,000 sq ft facility with cutting-edge technology achieving 99.99% cleanliness across all batches.</p>
      </div>
      <div class="card reveal" style="padding:32px;text-align:center">
        <div style="width:64px;height:64px;border-radius:50%;background:rgba(119,90,25,.1);display:flex;align-items:center;justify-content:center;margin:0 auto 20px"><span class="ms" style="font-size:32px;color:#775a19">verified</span></div>
        <div style="font-size:11px;font-weight:700;letter-spacing:.15em;text-transform:uppercase;color:#775a19;margin-bottom:8px">Step 03</div>
        <h4 style="font-size:19px;color:#163422;margin-bottom:10px">Quality Assurance</h4>
        <p style="font-size:14px;color:#424843;line-height:1.65">BRC, USFDA and multiple international certifications validate every product before export.</p>
      </div>
      <div class="card reveal" style="padding:32px;text-align:center">
        <div style="width:64px;height:64px;border-radius:50%;background:rgba(119,90,25,.1);display:flex;align-items:center;justify-content:center;margin:0 auto 20px"><span class="ms" style="font-size:32px;color:#775a19">local_shipping</span></div>
        <div style="font-size:11px;font-weight:700;letter-spacing:.15em;text-transform:uppercase;color:#775a19;margin-bottom:8px">Step 04</div>
        <h4 style="font-size:19px;color:#163422;margin-bottom:10px">Global Export</h4>
        <p style="font-size:14px;color:#424843;line-height:1.65">Star Export House status ensures timely, reliable delivery to international markets worldwide.</p>
      </div>
    </div>
  </div>
</section>
<section class="reveal" style="background:linear-gradient(135deg,#163422,#2d4b37);padding:96px 0;text-align:center">
  <div class="container">
    <h2 style="font-size:48px;color:#c8ebd0;margin-bottom:16px;font-style:italic">Want to Learn More?</h2>
    <p style="font-size:17px;color:rgba(200,235,208,.7);margin:0 auto 40px;max-width:480px;line-height:1.75">Reach out to us for company profiles, certifications, or any partnership enquiries.</p>
    <div style="display:flex;gap:16px;justify-content:center;flex-wrap:wrap">
      <a href="wholesale.html" class="btn btn-gold">Send Enquiry <span class="ms">send</span></a>
      <a href="quality.html" class="btn btn-outline-light">View Quality Standards</a>
    </div>
  </div>
</section>
'@ + $FOOTER

# ── QUALITY ────────────────────────────────────────────────────
$QUALITY = $HEAD + @'
<title>Quality Standards — Rithwik Industries</title>
<meta name="description" content="Our stringent quality assurance processes and international certifications that define Rithwik Industries.">
</head>
'@ + $NAV + @'
<section class="page-hero">
  <div class="container">
    <div class="reveal"><span class="tag tag-light">Quality Assurance</span></div>
    <div class="accent-line reveal" style="background:linear-gradient(90deg,#e9c176,#fed488)"></div>
    <h1 class="reveal" style="font-size:clamp(40px,5vw,68px);color:#c8ebd0;line-height:1.15;margin-bottom:20px">The Standard<br><em style="color:#e9c176">of Purity</em></h1>
    <p class="reveal" style="font-size:17px;color:rgba(200,235,208,.7);max-width:520px;line-height:1.75">Our commitment to quality is embedded in every stage — from seed selection to final export — with internationally certified processes guaranteeing absolute purity.</p>
  </div>
</section>
<section class="section">
  <div class="container">
    <div class="reveal" style="text-align:center;margin-bottom:64px">
      <span class="tag">Certifications</span>
      <h2 style="font-size:44px;color:#163422;margin:20px 0 16px">Our Certifications &amp; Standards</h2>
      <p style="font-size:17px;color:#424843;max-width:560px;margin:0 auto;line-height:1.75">Dedicated to quality control, evident through certifications that reflect our commitment to international food safety regulations.</p>
    </div>
    <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:24px;margin-bottom:80px">
      <div class="card reveal" style="padding:40px;text-align:center">
        <div style="width:80px;height:80px;border-radius:50%;background:linear-gradient(135deg,#775a19,#5d4214);display:flex;align-items:center;justify-content:center;margin:0 auto 20px;box-shadow:0 8px 20px rgba(119,90,25,.3)">
          <span style="font-family:'Playfair Display',serif;font-size:20px;font-weight:700;color:#fff">BRC</span>
        </div>
        <h4 style="font-size:20px;color:#163422;margin-bottom:10px">BRC Certified</h4>
        <p style="font-size:14px;color:#424843;line-height:1.65">British Retail Consortium certification — a globally recognized food safety standard ensuring highest quality management.</p>
      </div>
      <div class="card reveal" style="padding:40px;text-align:center">
        <div style="width:80px;height:80px;border-radius:50%;background:linear-gradient(135deg,#775a19,#5d4214);display:flex;align-items:center;justify-content:center;margin:0 auto 20px;box-shadow:0 8px 20px rgba(119,90,25,.3)">
          <span style="font-family:'Playfair Display',serif;font-size:14px;font-weight:700;color:#fff">USFDA</span>
        </div>
        <h4 style="font-size:20px;color:#163422;margin-bottom:10px">USFDA Registered</h4>
        <p style="font-size:14px;color:#424843;line-height:1.65">Registered with the U.S. Food &amp; Drug Administration, allowing direct exports to American markets.</p>
      </div>
      <div class="card reveal" style="padding:40px;text-align:center">
        <div style="width:80px;height:80px;border-radius:50%;background:linear-gradient(135deg,#163422,#2d4b37);display:flex;align-items:center;justify-content:center;margin:0 auto 20px;box-shadow:0 8px 20px rgba(22,52,34,.3)">
          <span class="ms" style="font-size:36px;color:#c8ebd0">eco</span>
        </div>
        <h4 style="font-size:20px;color:#163422;margin-bottom:10px">Organic Certified</h4>
        <p style="font-size:14px;color:#424843;line-height:1.65">Certified organic processing ensuring no harmful chemicals or additives are used at any stage.</p>
      </div>
      <div class="card reveal" style="padding:40px;text-align:center">
        <div style="width:80px;height:80px;border-radius:50%;background:linear-gradient(135deg,#163422,#2d4b37);display:flex;align-items:center;justify-content:center;margin:0 auto 20px;box-shadow:0 8px 20px rgba(22,52,34,.3)">
          <span class="ms" style="font-size:36px;color:#c8ebd0">workspace_premium</span>
        </div>
        <h4 style="font-size:20px;color:#163422;margin-bottom:10px">Star Export House</h4>
        <p style="font-size:14px;color:#424843;line-height:1.65">Government recognized Star Export House status — the highest export recognition in India's DGFT framework.</p>
      </div>
      <div class="card reveal" style="padding:40px;text-align:center">
        <div style="width:80px;height:80px;border-radius:50%;background:linear-gradient(135deg,#775a19,#5d4214);display:flex;align-items:center;justify-content:center;margin:0 auto 20px;box-shadow:0 8px 20px rgba(119,90,25,.3)">
          <span style="font-family:'Playfair Display',serif;font-size:16px;font-weight:700;color:#fff">FSSAI</span>
        </div>
        <h4 style="font-size:20px;color:#163422;margin-bottom:10px">FSSAI Licensed</h4>
        <p style="font-size:14px;color:#424843;line-height:1.65">Licensed by the Food Safety and Standards Authority of India, ensuring domestic and export food safety compliance.</p>
      </div>
      <div class="card reveal" style="padding:40px;text-align:center">
        <div style="width:80px;height:80px;border-radius:50%;background:linear-gradient(135deg,#163422,#2d4b37);display:flex;align-items:center;justify-content:center;margin:0 auto 20px;box-shadow:0 8px 20px rgba(22,52,34,.3)">
          <span class="ms" style="font-size:36px;color:#c8ebd0">diamond</span>
        </div>
        <h4 style="font-size:20px;color:#163422;margin-bottom:10px">ISO Standards</h4>
        <p style="font-size:14px;color:#424843;line-height:1.65">ISO-aligned quality management systems ensuring consistent processes across all production stages.</p>
      </div>
    </div>
    <div style="display:grid;grid-template-columns:1fr 1fr;gap:80px;align-items:center">
      <div class="reveal" style="position:relative;height:480px;border-radius:24px;overflow:hidden;box-shadow:0 40px 80px -20px rgba(22,52,34,.2)">
        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDwmEteuyo5gdxv-KCLfDVoMysAGr5oRAMO4qYNFSQZhOGy3Zb8rYw_Uoj3Vr29kUNn-RasGR1iQLAs07RTgDgNEog93bBpCp7sagWn6IjsMThCYqPGXXZd4_Amq-zwULLdZCyNobTmpxMnQwG9wYFx7WRB01H7FdKL3w1eT7Sh0pwzH7ng_9zvZxJHm2CtbkVvq7yDr7UjVijkiitHqEikp3GZVMjvgV8Gu82H2m8YnXRKXeKR19AeBYX0mf-qiAwS-S0Apmt-JHA" alt="Quality Process" style="width:100%;height:100%;object-fit:cover">
      </div>
      <div class="reveal">
        <span class="tag">Our Process</span>
        <h2 style="font-size:40px;color:#163422;margin:20px 0 20px;line-height:1.2">Multi-Stage Quality Control</h2>
        <div style="display:flex;flex-direction:column;gap:24px">
          <div style="display:flex;gap:16px;align-items:flex-start">
            <div style="width:36px;height:36px;border-radius:50%;background:#163422;color:#c8ebd0;display:flex;align-items:center;justify-content:center;font-size:14px;font-weight:700;flex-shrink:0">1</div>
            <div><h4 style="font-size:16px;font-weight:600;color:#163422;margin-bottom:6px">Raw Material Inspection</h4><p style="font-size:14px;color:#424843;line-height:1.65">Every incoming batch is visually and scientifically inspected for moisture, impurities and foreign matter.</p></div>
          </div>
          <div style="display:flex;gap:16px;align-items:flex-start">
            <div style="width:36px;height:36px;border-radius:50%;background:#163422;color:#c8ebd0;display:flex;align-items:center;justify-content:center;font-size:14px;font-weight:700;flex-shrink:0">2</div>
            <div><h4 style="font-size:16px;font-weight:600;color:#163422;margin-bottom:6px">Advanced Cleaning &amp; Sorting</h4><p style="font-size:14px;color:#424843;line-height:1.65">Multi-stage optical and gravity separation removes all impurities to achieve 99.99% purity levels.</p></div>
          </div>
          <div style="display:flex;gap:16px;align-items:flex-start">
            <div style="width:36px;height:36px;border-radius:50%;background:#163422;color:#c8ebd0;display:flex;align-items:center;justify-content:center;font-size:14px;font-weight:700;flex-shrink:0">3</div>
            <div><h4 style="font-size:16px;font-weight:600;color:#163422;margin-bottom:6px">Lab Testing</h4><p style="font-size:14px;color:#424843;line-height:1.65">In-house and third-party lab testing for heavy metals, pesticides and microbiological contaminants.</p></div>
          </div>
          <div style="display:flex;gap:16px;align-items:flex-start">
            <div style="width:36px;height:36px;border-radius:50%;background:#163422;color:#c8ebd0;display:flex;align-items:center;justify-content:center;font-size:14px;font-weight:700;flex-shrink:0">4</div>
            <div><h4 style="font-size:16px;font-weight:600;color:#163422;margin-bottom:6px">Export Packaging</h4><p style="font-size:14px;color:#424843;line-height:1.65">Certified export-grade packaging maintaining product integrity and shelf life across global transit.</p></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<section class="reveal" style="background:linear-gradient(135deg,#163422,#2d4b37);padding:96px 0;text-align:center">
  <div class="container">
    <h2 style="font-size:48px;color:#c8ebd0;margin-bottom:16px;font-style:italic">Certifications on Request</h2>
    <p style="font-size:17px;color:rgba(200,235,208,.7);margin:0 auto 40px;max-width:480px;line-height:1.75">We provide full certification documentation and lab reports with every wholesale enquiry.</p>
    <a href="wholesale.html" class="btn btn-gold">Request Documentation <span class="ms">description</span></a>
  </div>
</section>
'@ + $FOOTER

# ── MILLETS ────────────────────────────────────────────────────
$MILLETS = $HEAD + @'
<title>Premium Millets — Rithwik Industries</title>
<meta name="description" content="Explore Rithwik Industries' premium millet varieties — Foxtail, Kodo, Proso, Barnyard, Browntop and Little Millet.">
</head>
'@ + $NAV + @'
<section class="page-hero">
  <div class="container">
    <div class="reveal"><span class="tag tag-light">Organic Millets</span></div>
    <div class="accent-line reveal" style="background:linear-gradient(90deg,#e9c176,#fed488)"></div>
    <h1 class="reveal" style="font-size:clamp(40px,5vw,68px);color:#c8ebd0;line-height:1.15;margin-bottom:20px">Premium<br><em style="color:#e9c176">Millets</em></h1>
    <p class="reveal" style="font-size:17px;color:rgba(200,235,208,.7);max-width:520px;line-height:1.75">Six premium millet varieties, each meticulously cleaned and processed in our state-of-the-art facility. Gluten-free, nutrient-dense, and perfect for global health-conscious markets.</p>
  </div>
</section>
<section class="section">
  <div class="container">
    <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:24px">
'@ + @'
      <div class="card reveal" style="overflow:hidden">
        <div style="height:240px;background:linear-gradient(145deg,#eef5f0,#dbeae0);position:relative;overflow:hidden">
          <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDwmEteuyo5gdxv-KCLfDVoMysAGr5oRAMO4qYNFSQZhOGy3Zb8rYw_Uoj3Vr29kUNn-RasGR1iQLAs07RTgDgNEog93bBpCp7sagWn6IjsMThCYqPGXXZd4_Amq-zwULLdZCyNobTmpxMnQwG9wYFx7WRB01H7FdKL3w1eT7Sh0pwzH7ng_9zvZxJHm2CtbkVvq7yDr7UjVijkiitHqEikp3GZVMjvgV8Gu82H2m8YnXRKXeKR19AeBYX0mf-qiAwS-S0Apmt-JHA" alt="Foxtail Millet" style="width:100%;height:100%;object-fit:cover;transition:transform .5s" onmouseover="this.style.transform='scale(1.06)'" onmouseout="this.style.transform='scale(1)'">
          <div style="position:absolute;top:16px;left:16px"><span class="tag">Foxtail Millet</span></div>
        </div>
        <div style="padding:28px">
          <h3 style="font-size:22px;color:#163422;margin-bottom:10px">Foxtail Millet</h3>
          <p style="font-size:14px;color:#424843;line-height:1.65;margin-bottom:20px">High protein content, great for diabetics. Known for its nutty flavor and quick-cooking properties. Widely exported across Asia and Europe.</p>
          <a href="wholesale.html" class="btn btn-green btn-sm">Request Quote <span class="ms">arrow_forward</span></a>
        </div>
      </div>
      <div class="card reveal" style="overflow:hidden">
        <div style="height:240px;background:linear-gradient(145deg,#f5f0e8,#ede3d0);position:relative;overflow:hidden">
          <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDwmEteuyo5gdxv-KCLfDVoMysAGr5oRAMO4qYNFSQZhOGy3Zb8rYw_Uoj3Vr29kUNn-RasGR1iQLAs07RTgDgNEog93bBpCp7sagWn6IjsMThCYqPGXXZd4_Amq-zwULLdZCyNobTmpxMnQwG9wYFx7WRB01H7FdKL3w1eT7Sh0pwzH7ng_9zvZxJHm2CtbkVvq7yDr7UjVijkiitHqEikp3GZVMjvgV8Gu82H2m8YnXRKXeKR19AeBYX0mf-qiAwS-S0Apmt-JHA" alt="Kodo Millet" style="width:100%;height:100%;object-fit:cover;transition:transform .5s" onmouseover="this.style.transform='scale(1.06)'" onmouseout="this.style.transform='scale(1)'">
          <div style="position:absolute;top:16px;left:16px"><span class="tag">Kodo Millet</span></div>
        </div>
        <div style="padding:28px">
          <h3 style="font-size:22px;color:#163422;margin-bottom:10px">Kodo Millet</h3>
          <p style="font-size:14px;color:#424843;line-height:1.65;margin-bottom:20px">Rich in fiber and antioxidants. Excellent for blood sugar management and cardiovascular health. A staple for health-conscious consumers.</p>
          <a href="wholesale.html" class="btn btn-green btn-sm">Request Quote <span class="ms">arrow_forward</span></a>
        </div>
      </div>
      <div class="card reveal" style="overflow:hidden">
        <div style="height:240px;background:linear-gradient(145deg,#eef5f0,#dbeae0);position:relative;overflow:hidden">
          <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDwmEteuyo5gdxv-KCLfDVoMysAGr5oRAMO4qYNFSQZhOGy3Zb8rYw_Uoj3Vr29kUNn-RasGR1iQLAs07RTgDgNEog93bBpCp7sagWn6IjsMThCYqPGXXZd4_Amq-zwULLdZCyNobTmpxMnQwG9wYFx7WRB01H7FdKL3w1eT7Sh0pwzH7ng_9zvZxJHm2CtbkVvq7yDr7UjVijkiitHqEikp3GZVMjvgV8Gu82H2m8YnXRKXeKR19AeBYX0mf-qiAwS-S0Apmt-JHA" alt="Proso Millet" style="width:100%;height:100%;object-fit:cover;transition:transform .5s" onmouseover="this.style.transform='scale(1.06)'" onmouseout="this.style.transform='scale(1)'">
          <div style="position:absolute;top:16px;left:16px"><span class="tag">Proso Millet</span></div>
        </div>
        <div style="padding:28px">
          <h3 style="font-size:22px;color:#163422;margin-bottom:10px">Proso Millet</h3>
          <p style="font-size:14px;color:#424843;line-height:1.65;margin-bottom:20px">Fast-growing, drought-resistant variety. High in protein and essential B vitamins. Popular in Eastern Europe and North America.</p>
          <a href="wholesale.html" class="btn btn-green btn-sm">Request Quote <span class="ms">arrow_forward</span></a>
        </div>
      </div>
      <div class="card reveal" style="overflow:hidden">
        <div style="height:240px;background:linear-gradient(145deg,#f0f5f1,#e0ebe3);position:relative;overflow:hidden">
          <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDwmEteuyo5gdxv-KCLfDVoMysAGr5oRAMO4qYNFSQZhOGy3Zb8rYw_Uoj3Vr29kUNn-RasGR1iQLAs07RTgDgNEog93bBpCp7sagWn6IjsMThCYqPGXXZd4_Amq-zwULLdZCyNobTmpxMnQwG9wYFx7WRB01H7FdKL3w1eT7Sh0pwzH7ng_9zvZxJHm2CtbkVvq7yDr7UjVijkiitHqEikp3GZVMjvgV8Gu82H2m8YnXRKXeKR19AeBYX0mf-qiAwS-S0Apmt-JHA" alt="Browntop Millet" style="width:100%;height:100%;object-fit:cover;transition:transform .5s" onmouseover="this.style.transform='scale(1.06)'" onmouseout="this.style.transform='scale(1)'">
          <div style="position:absolute;top:16px;left:16px"><span class="tag">Browntop Millet</span></div>
        </div>
        <div style="padding:28px">
          <h3 style="font-size:22px;color:#163422;margin-bottom:10px">Browntop Millet</h3>
          <p style="font-size:14px;color:#424843;line-height:1.65;margin-bottom:20px">Rare and nutritious ancient grain rich in iron and calcium. Gaining popularity in premium health food markets globally.</p>
          <a href="wholesale.html" class="btn btn-green btn-sm">Request Quote <span class="ms">arrow_forward</span></a>
        </div>
      </div>
      <div class="card reveal" style="overflow:hidden">
        <div style="height:240px;background:linear-gradient(145deg,#faf5ea,#f0e8d0);position:relative;overflow:hidden">
          <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDwmEteuyo5gdxv-KCLfDVoMysAGr5oRAMO4qYNFSQZhOGy3Zb8rYw_Uoj3Vr29kUNn-RasGR1iQLAs07RTgDgNEog93bBpCp7sagWn6IjsMThCYqPGXXZd4_Amq-zwULLdZCyNobTmpxMnQwG9wYFx7WRB01H7FdKL3w1eT7Sh0pwzH7ng_9zvZxJHm2CtbkVvq7yDr7UjVijkiitHqEikp3GZVMjvgV8Gu82H2m8YnXRKXeKR19AeBYX0mf-qiAwS-S0Apmt-JHA" alt="Barnyard Millet" style="width:100%;height:100%;object-fit:cover;transition:transform .5s" onmouseover="this.style.transform='scale(1.06)'" onmouseout="this.style.transform='scale(1)'">
          <div style="position:absolute;top:16px;left:16px"><span class="tag">Barnyard Millet</span></div>
        </div>
        <div style="padding:28px">
          <h3 style="font-size:22px;color:#163422;margin-bottom:10px">Barnyard Millet</h3>
          <p style="font-size:14px;color:#424843;line-height:1.65;margin-bottom:20px">Lowest glycemic index among all millets. Ideal for fasting food products and weight management diets. High in iron and zinc.</p>
          <a href="wholesale.html" class="btn btn-green btn-sm">Request Quote <span class="ms">arrow_forward</span></a>
        </div>
      </div>
      <div class="card reveal" style="overflow:hidden">
        <div style="height:240px;background:linear-gradient(145deg,#f0f5f1,#dbeae0);position:relative;overflow:hidden">
          <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDwmEteuyo5gdxv-KCLfDVoMysAGr5oRAMO4qYNFSQZhOGy3Zb8rYw_Uoj3Vr29kUNn-RasGR1iQLAs07RTgDgNEog93bBpCp7sagWn6IjsMThCYqPGXXZd4_Amq-zwULLdZCyNobTmpxMnQwG9wYFx7WRB01H7FdKL3w1eT7Sh0pwzH7ng_9zvZxJHm2CtbkVvq7yDr7UjVijkiitHqEikp3GZVMjvgV8Gu82H2m8YnXRKXeKR19AeBYX0mf-qiAwS-S0Apmt-JHA" alt="Little Millet" style="width:100%;height:100%;object-fit:cover;transition:transform .5s" onmouseover="this.style.transform='scale(1.06)'" onmouseout="this.style.transform='scale(1)'">
          <div style="position:absolute;top:16px;left:16px"><span class="tag">Little Millet</span></div>
        </div>
        <div style="padding:28px">
          <h3 style="font-size:22px;color:#163422;margin-bottom:10px">Little Millet</h3>
          <p style="font-size:14px;color:#424843;line-height:1.65;margin-bottom:20px">High in magnesium and phosphorus. A versatile grain that can be used in porridges, flours and fermented food products.</p>
          <a href="wholesale.html" class="btn btn-green btn-sm">Request Quote <span class="ms">arrow_forward</span></a>
        </div>
      </div>
    </div>
    <div class="reveal" style="text-align:center;margin-top:64px;padding:48px;background:#f4f4ee;border-radius:24px">
      <span class="tag">Bulk Available</span>
      <h2 style="font-size:40px;color:#163422;margin:20px 0 16px">Ready to Order in Bulk?</h2>
      <p style="font-size:16px;color:#424843;margin:0 auto 32px;max-width:480px;line-height:1.75">All millet varieties are available for bulk export. We provide competitive pricing, lab reports and full certification documents.</p>
      <div style="display:flex;gap:16px;justify-content:center;flex-wrap:wrap">
        <a href="wholesale.html" class="btn btn-green">Get a Quote <span class="ms">send</span></a>
        <a href="quality.html" class="btn btn-outline">View Certifications</a>
      </div>
    </div>
  </div>
</section>
'@ + $FOOTER

# ── PRODUCTS (Bird Feeds) ───────────────────────────────────────
$PRODUCTS = $HEAD + @'
<title>Bird Feed Blends &amp; Seeds — Rithwik Industries</title>
<meta name="description" content="Scientifically formulated bird feed blends and premium seeds from Rithwik Industries.">
</head>
'@ + $NAV + @'
<section class="page-hero">
  <div class="container">
    <div class="reveal"><span class="tag tag-light">Bird Feeds &amp; Seeds</span></div>
    <div class="accent-line reveal" style="background:linear-gradient(90deg,#e9c176,#fed488)"></div>
    <h1 class="reveal" style="font-size:clamp(40px,5vw,68px);color:#c8ebd0;line-height:1.15;margin-bottom:20px">Premium<br><em style="color:#e9c176">Nutrition Blends</em></h1>
    <p class="reveal" style="font-size:17px;color:rgba(200,235,208,.7);max-width:520px;line-height:1.75">Scientifically formulated bird feed blends and premium organic seeds, sourced from India's finest farms and processed to international standards.</p>
  </div>
</section>
<section class="section">
  <div class="container">
    <div class="reveal" style="text-align:center;margin-bottom:64px">
      <span class="tag">Bird Feed Blends</span>
      <h2 style="font-size:44px;color:#163422;margin:20px 0 16px">Avian Nutrition Range</h2>
      <p style="font-size:17px;color:#424843;max-width:560px;margin:0 auto;line-height:1.75">Each blend is scientifically formulated to ensure optimal health, vitality and plumage quality for avian companions.</p>
    </div>
    <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:24px;margin-bottom:80px">
      <div class="card reveal" style="padding:36px">
        <span class="ms" style="font-size:40px;color:#775a19;display:block;margin-bottom:16px">grass</span>
        <h3 style="font-size:22px;color:#163422;margin-bottom:12px">Finch &amp; Canary Mix</h3>
        <p style="font-size:14px;color:#424843;line-height:1.65;margin-bottom:20px">Premium blend of canary grass, millet, hemp and niger seeds. Formulated for optimal energy and brilliant plumage.</p>
        <div style="margin-bottom:24px;padding:16px;background:#f4f4ee;border-radius:12px">
          <p style="font-size:12px;font-weight:700;text-transform:uppercase;letter-spacing:.1em;color:#775a19;margin-bottom:8px">Key Ingredients</p>
          <p style="font-size:13px;color:#424843">Canary Grass, White Millet, Hemp Seeds, Niger Seeds</p>
        </div>
        <a href="wholesale.html" class="btn btn-green btn-sm">Request Quote <span class="ms">arrow_forward</span></a>
      </div>
      <div class="card reveal" style="padding:36px">
        <span class="ms" style="font-size:40px;color:#775a19;display:block;margin-bottom:16px">flutter</span>
        <h3 style="font-size:22px;color:#163422;margin-bottom:12px">Parrot &amp; Macaw Blend</h3>
        <p style="font-size:14px;color:#424843;line-height:1.65;margin-bottom:20px">Nutrient-dense mix with sunflower seeds, safflower, millet and dried fruits. Rich in healthy fats and vitamins.</p>
        <div style="margin-bottom:24px;padding:16px;background:#f4f4ee;border-radius:12px">
          <p style="font-size:12px;font-weight:700;text-transform:uppercase;letter-spacing:.1em;color:#775a19;margin-bottom:8px">Key Ingredients</p>
          <p style="font-size:13px;color:#424843">Sunflower, Safflower, Millet, Peanuts, Dried Papaya</p>
        </div>
        <a href="wholesale.html" class="btn btn-green btn-sm">Request Quote <span class="ms">arrow_forward</span></a>
      </div>
      <div class="card reveal" style="padding:36px">
        <span class="ms" style="font-size:40px;color:#775a19;display:block;margin-bottom:16px">egg_alt</span>
        <h3 style="font-size:22px;color:#163422;margin-bottom:12px">Wild Bird Mix</h3>
        <p style="font-size:14px;color:#424843;line-height:1.65;margin-bottom:20px">Balanced blend suitable for all wild bird species. High energy formula ideal for garden feeders and wildlife sanctuaries.</p>
        <div style="margin-bottom:24px;padding:16px;background:#f4f4ee;border-radius:12px">
          <p style="font-size:12px;font-weight:700;text-transform:uppercase;letter-spacing:.1em;color:#775a19;margin-bottom:8px">Key Ingredients</p>
          <p style="font-size:13px;color:#424843">Red Millet, Foxtail Millet, Sunflower, Oats, Corn</p>
        </div>
        <a href="wholesale.html" class="btn btn-green btn-sm">Request Quote <span class="ms">arrow_forward</span></a>
      </div>
    </div>
    <!-- Seeds Grid -->
    <div class="reveal" style="text-align:center;margin-bottom:64px">
      <span class="tag">Organic Seeds</span>
      <h2 style="font-size:44px;color:#163422;margin:20px 0 16px">Premium Seed Range</h2>
      <p style="font-size:17px;color:#424843;max-width:560px;margin:0 auto;line-height:1.75">Individual premium seeds available in bulk for manufacturers, wholesalers and distributors globally.</p>
    </div>
    <div style="display:grid;grid-template-columns:repeat(4,1fr);gap:20px">
      <div class="card reveal" style="padding:28px;text-align:center">
        <span class="ms" style="font-size:32px;color:#775a19;display:block;margin-bottom:12px">local_florist</span>
        <h4 style="font-size:18px;color:#163422;margin-bottom:8px">Pumpkin Seeds</h4>
        <p style="font-size:13px;color:#424843;line-height:1.6;margin-bottom:16px">Rich in zinc and antioxidants. Premium grade for human consumption and bird feeds.</p>
        <a href="wholesale.html" class="btn btn-outline btn-sm" style="font-size:11px;padding:8px 16px">Get Quote</a>
      </div>
      <div class="card reveal" style="padding:28px;text-align:center">
        <span class="ms" style="font-size:32px;color:#775a19;display:block;margin-bottom:12px">wb_sunny</span>
        <h4 style="font-size:18px;color:#163422;margin-bottom:8px">Sunflower Seeds</h4>
        <p style="font-size:13px;color:#424843;line-height:1.6;margin-bottom:16px">High in Vitamin E and selenium. Available hulled and unhulled for various applications.</p>
        <a href="wholesale.html" class="btn btn-outline btn-sm" style="font-size:11px;padding:8px 16px">Get Quote</a>
      </div>
      <div class="card reveal" style="padding:28px;text-align:center">
        <span class="ms" style="font-size:32px;color:#775a19;display:block;margin-bottom:12px">water_drop</span>
        <h4 style="font-size:18px;color:#163422;margin-bottom:8px">Flax Seeds</h4>
        <p style="font-size:13px;color:#424843;line-height:1.6;margin-bottom:16px">Excellent source of Omega-3 fatty acids. Brown and golden varieties available.</p>
        <a href="wholesale.html" class="btn btn-outline btn-sm" style="font-size:11px;padding:8px 16px">Get Quote</a>
      </div>
      <div class="card reveal" style="padding:28px;text-align:center">
        <span class="ms" style="font-size:32px;color:#775a19;display:block;margin-bottom:12px">spa</span>
        <h4 style="font-size:18px;color:#163422;margin-bottom:8px">Sesame Seeds</h4>
        <p style="font-size:13px;color:#424843;line-height:1.6;margin-bottom:16px">High calcium content. Natural, toasted and hulled varieties available for export.</p>
        <a href="wholesale.html" class="btn btn-outline btn-sm" style="font-size:11px;padding:8px 16px">Get Quote</a>
      </div>
    </div>
  </div>
</section>
<section class="reveal" style="background:linear-gradient(135deg,#163422,#2d4b37);padding:96px 0;text-align:center">
  <div class="container">
    <h2 style="font-size:48px;color:#c8ebd0;margin-bottom:16px;font-style:italic">Custom Blends Available</h2>
    <p style="font-size:17px;color:rgba(200,235,208,.7);margin:0 auto 40px;max-width:480px;line-height:1.75">We can create custom bird feed formulations tailored to your specific requirements and market needs.</p>
    <a href="wholesale.html" class="btn btn-gold">Request Custom Blend <span class="ms">science</span></a>
  </div>
</section>
'@ + $FOOTER

# Write all pages
Set-Content -Path "./index.html" -Value $INDEX -Encoding UTF8
Set-Content -Path "./wholesale.html" -Value $WHOLESALE -Encoding UTF8
Set-Content -Path "./about.html" -Value $ABOUT -Encoding UTF8
Set-Content -Path "./quality.html" -Value $QUALITY -Encoding UTF8
Set-Content -Path "./millets.html" -Value $MILLETS -Encoding UTF8
Set-Content -Path "./products.html" -Value $PRODUCTS -Encoding UTF8

# Clean up old stitch screens
Remove-Item -Path "./enquiry-success.html" -Force -ErrorAction SilentlyContinue

Write-Host "ALL PAGES WRITTEN SUCCESSFULLY"
