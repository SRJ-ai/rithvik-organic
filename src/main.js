import './style.css'
import gsap from "gsap";
import ScrollTrigger from "gsap/ScrollTrigger";
import { initWebGLParticles } from './webgl.js';
gsap.registerPlugin(ScrollTrigger);

// i18n Dictionary
const i18n = {
  en: {
    nav_home: "Home", nav_about: "About", nav_why_us: "Why Us", nav_products: "Products", nav_enquire: "Enquire Now",
    form_name: "Full Name", form_name_ph: "Your Name", form_email: "Email Address", form_email_ph: "Your Email",
    form_interest: "Product of Interest", form_msg: "Your Message", form_submit: "Send Enquiry",
    opt_millets: "Premium Millets", opt_seeds: "Seeds & Superfoods", opt_birdfeed: "Bird Feeds", opt_other: "Other Spices/Dals",
    btn_download: "Download Full PDF Catalog"
  },
  jp: {
    nav_home: "ホーム", nav_about: "私たちについて", nav_why_us: "選ばれる理由", nav_products: "製品", nav_enquire: "お問い合わせ",
    form_name: "氏名", form_name_ph: "あなたの名前", form_email: "メールアドレス", form_email_ph: "あなたのメール",
    form_interest: "興味のある製品", form_msg: "メッセージ", form_submit: "送信する",
    opt_millets: "プレミアム雑穀", opt_seeds: "種子とスーパーフード", opt_birdfeed: "鳥の餌", opt_other: "その他のスパイス",
    btn_download: "PDFカタログをダウンロード"
  },
  ar: {
    nav_home: "الرئيسية", nav_about: "معلومات عنا", nav_why_us: "لماذا نحن", nav_products: "منتجاتنا", nav_enquire: "استفسر الآن",
    form_name: "الاسم الكامل", form_name_ph: "اسمك", form_email: "البريد الإلكتروني", form_email_ph: "بريدك الإلكتروني",
    form_interest: "المنتج الذي يهمك", form_msg: "رسالتك", form_submit: "إرسال الاستفسار",
    opt_millets: "الدخن الممتاز", opt_seeds: "البذور والأطعمة الفائقة", opt_birdfeed: "تغذية الطيور", opt_other: "توابل أخرى",
    btn_download: "تحميل الكتالوج الكامل (PDF)"
  }
};

// Cinematic Preloader & Hero Intro
document.addEventListener('DOMContentLoaded', () => {
  setTimeout(() => {
    const preloader = document.getElementById('preloader');
    if (preloader) {
      preloader.classList.add('hidden');
      setTimeout(() => preloader.style.display = 'none', 500);
      
      // Hero GSAP Intro Sequence
      const heroTl = gsap.timeline({ delay: 0.1 });
      heroTl.fromTo(".hero-badge", { opacity: 0, y: -20 }, { opacity: 1, y: 0, duration: 0.6, ease: "power3.out" })
            .fromTo(".gsap-hero-line", { opacity: 0, y: 30 }, { opacity: 1, y: 0, duration: 0.8, stagger: 0.1, ease: "power4.out" }, "-=0.4");
    }
  }, 50); // Instantly drop preloader after DOM is painted
});

document.addEventListener('DOMContentLoaded', () => {
  // Initialize WebGL Particles
  initWebGLParticles();

  // Custom Fluid Cursor
  const cursor = document.querySelector('.custom-cursor');
  if (cursor) {
    let mouseX = window.innerWidth / 2, mouseY = window.innerHeight / 2;
    let cursorX = mouseX, cursorY = mouseY;
    
    const xSet = gsap.quickSetter(cursor, "x", "px");
    const ySet = gsap.quickSetter(cursor, "y", "px");

    window.addEventListener('mousemove', e => {
      mouseX = e.clientX;
      mouseY = e.clientY;
    });

    gsap.ticker.add(() => {
      cursorX += (mouseX - cursorX) * 0.15;
      cursorY += (mouseY - cursorY) * 0.15;
      xSet(cursorX);
      ySet(cursorY);
    });

    const hoverElements = document.querySelectorAll('a, button, input, textarea, select, .map-node-gsap, .btn');
    hoverElements.forEach(el => {
      el.addEventListener('mouseenter', () => cursor.classList.add('hovering'));
      el.addEventListener('mouseleave', () => cursor.classList.remove('hovering'));
    });
  }

  // Section Transition Engine
  const curtain = document.querySelector('.transition-curtain');
  document.querySelectorAll('.nav-links a, .btn[href^="#"]').forEach(link => {
    link.addEventListener('click', (e) => {
      e.preventDefault();
      const targetId = link.getAttribute('href');
      if(targetId === '#') return;
      const targetElement = document.querySelector(targetId);
      
      if(targetElement && curtain) {
        gsap.timeline()
          .to(curtain, { top: 0, duration: 0.5, ease: "power4.inOut" })
          .call(() => {
            window.scrollTo({
              top: targetElement.offsetTop - 80,
              behavior: 'auto'
            });
          })
          .to(curtain, { top: "100%", duration: 0.5, ease: "power4.inOut", delay: 0.1 })
          .set(curtain, { top: "-100%" });
      } else if(targetElement) {
         window.scrollTo({
           top: targetElement.offsetTop - 80,
           behavior: 'smooth'
         });
      }
    });
  });

  // Navbar scroll effect
  const navbar = document.querySelector('.navbar');
  window.addEventListener('scroll', () => {
    if (window.scrollY > 50) {
      navbar.classList.add('scrolled');
    } else {
      navbar.classList.remove('scrolled');
    }
  });

  // Parallax Hero Effect
  const heroBg = document.querySelector('.hero-bg');
  window.addEventListener('scroll', () => {
    if(heroBg) {
      let scrollPos = window.scrollY;
      // Smooth parallax translation
      heroBg.style.transform = `scale(1.05) translateY(${scrollPos * 0.4}px)`;
    }
  });


  // Intersection Observer for scroll animations
  const observerOptions = {
    root: null,
    rootMargin: '0px',
    threshold: 0.15
  };

  const observer = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        observer.unobserve(entry.target); 
      }
    });
  }, observerOptions);

  // Select elements to animate
  const animatedElements = document.querySelectorAll('.fade-in-scroll, .slide-left, .slide-right');
  animatedElements.forEach(el => observer.observe(el));

  // Farm to Export Scroll Story
  const storySteps = document.querySelectorAll('.story-step');
  const storyImage = document.getElementById('story-image');
  
  if (storySteps.length > 0 && storyImage) {
    const imgSources = ['./hero_bg.png', './millets_showcase.png', './seeds_superfoods.png'];

    ScrollTrigger.matchMedia({
      "(min-width: 993px)": function() {
        // Use GSAP to handle step opacity and image changing synced with the pin
        storySteps.forEach((step, index) => {
          ScrollTrigger.create({
            trigger: step,
            start: "top center",
            end: "bottom center",
            onEnter: () => {
              storySteps.forEach(s => s.classList.remove('active'));
              step.classList.add('active');
              if(storyImage.getAttribute('src') !== imgSources[index]) {
                storyImage.style.opacity = 0;
                setTimeout(() => {
                  storyImage.src = imgSources[index] || imgSources[0];
                  storyImage.style.opacity = 1;
                }, 300);
              }
            },
            onEnterBack: () => {
              storySteps.forEach(s => s.classList.remove('active'));
              step.classList.add('active');
              if(storyImage.getAttribute('src') !== imgSources[index]) {
                storyImage.style.opacity = 0;
                setTimeout(() => {
                  storyImage.src = imgSources[index] || imgSources[0];
                  storyImage.style.opacity = 1;
                }, 300);
              }
            }
          });
        });
        
        // Default active for first step
        if(storySteps[0]) storySteps[0].classList.add('active');
      },
      "(max-width: 992px)": function() {
        storySteps.forEach(s => s.classList.add('active'));
      }
    });
  }

  // Particle generation for Hero
  const particlesContainer = document.getElementById('particles');
  if (particlesContainer) {
    for (let i = 0; i < 30; i++) {
      let particle = document.createElement('div');
      particle.classList.add('particle');
      
      // Randomize properties
      let size = Math.random() * 5 + 2; // 2px to 7px
      let posX = Math.random() * 100; // 0vw to 100vw
      let delay = Math.random() * 5; // 0s to 5s
      let duration = Math.random() * 5 + 5; // 5s to 10s
      
      particle.style.width = `${size}px`;
      particle.style.height = `${size}px`;
      particle.style.left = `${posX}vw`;
      particle.style.animationDelay = `${delay}s`;
      particle.style.animationDuration = `${duration}s`;
      
      particlesContainer.appendChild(particle);
    }
  }



  // Magnetic Button Effect
  const magnetButton = document.querySelector('.btn-glow');
  if(magnetButton) {
    magnetButton.addEventListener('mousemove', function(e) {
      const position = magnetButton.getBoundingClientRect();
      const x = e.clientX - position.left - position.width / 2;
      const y = e.clientY - position.top - position.height / 2;
      
      magnetButton.style.transform = `translate(${x * 0.3}px, ${y * 0.5}px)`;
    });

    magnetButton.addEventListener('mouseout', function() {
      magnetButton.style.transform = 'translate(0px, 0px)';
    });
  }

  // Product Modals Data & Logic
  const productData = {
    millets: {
      title: "Premium Millets",
      specs: [
        "Purity: 99.99% Sortex Cleaned",
        "Moisture: 10% - 12% Max",
        "Origin: Indian Farmlands",
        "Type: 100% Organic, Non-GMO"
      ],
      packaging: [
        "25 kg / 50 kg PP Bags",
        "Jute Bags",
        "Custom White-Label Packaging",
        "Vacuum Packed Options"
      ]
    },
    superfoods: {
      title: "Seeds & Super Foods",
      specs: [
        "Quality: Premium Grade A",
        "Processing: Raw & Roasted Available",
        "Shelf Life: 12-24 Months",
        "Certifications: BRC, APEDA, USFDA"
      ],
      packaging: [
        "10 kg / 25 kg Vacuum Pouches",
        "Custom Retail Pouches (250g, 500g)",
        "Bulk Cartons"
      ]
    }
  };

  const modal = document.getElementById('product-modal');
  const modalTitle = document.getElementById('modal-title');
  const modalSpecs = document.getElementById('modal-specs-list');
  const modalPackaging = document.getElementById('modal-packaging-list');
  const modalClose = document.getElementById('modal-close');

  if (modal) {
    document.querySelectorAll('.view-details-btn').forEach(btn => {
      btn.addEventListener('click', (e) => {
        e.preventDefault();
        const prodKey = btn.getAttribute('data-product');
        const data = productData[prodKey];
        
        if(data) {
          modalTitle.innerText = data.title;
          modalSpecs.innerHTML = data.specs.map(s => `<li>${s}</li>`).join('');
          modalPackaging.innerHTML = data.packaging.map(p => `<li>${p}</li>`).join('');
          modal.classList.add('active');
        }
      });
    });

    modalClose.addEventListener('click', () => {
      modal.classList.remove('active');
    });

    // Close on backdrop click
    modal.addEventListener('click', (e) => {
      if (e.target === modal) {
        modal.classList.remove('active');
      }
    });
  }
  // GSAP Map Animation & Interactivity
  const mapContainer = document.querySelector('.custom-map-container');
  if (mapContainer) {
    const routes = document.querySelectorAll('.gsap-route');
    const nodes = document.querySelectorAll('.dest-node');
    
    // Map Animation Timeline
    const mapTl = gsap.timeline({
      scrollTrigger: {
        trigger: ".global-reach",
        start: "top center",
      }
    });

    // 1. Pop in Kurnool Hub
    mapTl.fromTo(".kurnool-hub", 
      { opacity: 0, scale: 0, transformOrigin: "center" },
      { opacity: 1, scale: 1, duration: 1, ease: "back.out(1.5)" }
    )
    // 2. Draw routes out from Kurnool
    .to(routes, {
      strokeDashoffset: 0,
      duration: 2.5,
      ease: "power2.inOut",
      stagger: 0.2
    }, "-=0.2");

    // Hover cards
    nodes.forEach(node => {
      node.addEventListener('mouseenter', () => {
        const cardId = node.getAttribute('data-card');
        const card = document.getElementById(cardId);
        if(card) {
          gsap.to(card, { opacity: 1, y: 0, autoAlpha: 1, duration: 0.3 });
          gsap.to(node.querySelector('circle'), { scale: 1.5, transformOrigin: 'center', duration: 0.2 });
        }
      });
      node.addEventListener('mouseleave', () => {
        const cardId = node.getAttribute('data-card');
        const card = document.getElementById(cardId);
        if(card) {
          gsap.to(card, { opacity: 0, y: 20, autoAlpha: 0, duration: 0.3 });
          gsap.to(node.querySelector('circle'), { scale: 1, transformOrigin: 'center', duration: 0.2 });
        }
      });
    });
  }

  // Language Switcher Logic
  const langSelect = document.getElementById('lang-select');
  if(langSelect) {
    langSelect.addEventListener('change', (e) => {
      const lang = e.target.value;
      const dict = i18n[lang];
      
      // Update RTL
      if(lang === 'ar') document.body.classList.add('rtl');
      else document.body.classList.remove('rtl');

      // Swap Text
      document.querySelectorAll('[data-i18n]').forEach(el => {
        const key = el.getAttribute('data-i18n');
        if(dict[key]) el.innerHTML = dict[key];
      });
      
      // Swap Placeholders
      document.querySelectorAll('[data-i18n-ph]').forEach(el => {
        const key = el.getAttribute('data-i18n-ph');
        if(dict[key]) el.placeholder = dict[key];
      });
    });
  }



  // Form Validation & Submission Animation
  const form = document.getElementById('enquiryForm');
  if(form) {
    form.addEventListener('submit', (e) => {
      e.preventDefault();
      const btn = document.getElementById('submit-btn');
      const text = btn.querySelector('.btn-text');
      const loader = btn.querySelector('.btn-loader');
      
      // Loading State
      text.style.opacity = '0';
      loader.style.display = 'block';
      
      setTimeout(() => {
        text.innerText = "Message Sent! ✅";
        text.style.opacity = '1';
        loader.style.display = 'none';
        form.reset();
        
        setTimeout(() => {
          text.innerText = i18n[langSelect.value].form_submit;
        }, 3000);
      }, 2000);
    });
  }
});
