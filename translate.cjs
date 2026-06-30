const fs = require('fs');
const path = require('path');

const jsPath = path.join(__dirname, 'src', 'main.js');
let jsContent = fs.readFileSync(jsPath, 'utf8');

const newTranslations = `{
  en: {
    nav_home: "Home", nav_about: "About", nav_why_us: "Why Us", nav_products: "Products", nav_enquire: "Enquire Now",
    hero_badge: "Since 2010 &bull; Govt. Recognized Export House",
    hero_title_1: "Nature's Grain,",
    hero_title_2: "Nurtured for You",
    hero_subtitle: "Premium Millets, Superfoods & Spices Exported Globally from Indian Farmlands to the World.",
    btn_explore: "Explore Our Exports",
    ticker_1: "🟢 Recent Shipment: 200MT Premium Millets to Tokyo, Japan",
    ticker_2: "🟢 Quality Control: 99.99% Sortex Cleaned Batch Approved",
    ticker_3: "🟢 En Route: Container dispatch to Dubai, UAE",
    ticker_4: "🟢 Recent Shipment: 50MT Superfoods to London, UK",
    story_title_1: "Sustainable Sourcing",
    story_desc_1: "Through partnerships with Indian farmers, we promote sustainable practices to source the finest millets, spices, and superfoods directly from nature.",
    story_title_2: "Advanced Processing",
    story_desc_2: "Our expansive 25,000 sq ft manufacturing facility near Bangalore uses cutting-edge technology, achieving an impressive 99.99% cleanliness level.",
    story_title_3: "Global Export",
    story_desc_3: "As a government-recognized Star Export House, we ensure timely delivery of 100% natural, premium products to international markets.",
    map_kurnool_title: "Kurnool, India",
    map_kurnool_desc: "Global Operations Hub",
    form_name: "Full Name", form_name_ph: "Your Name", form_email: "Email Address", form_email_ph: "Your Email",
    form_interest: "Product of Interest", form_msg: "Your Message", form_submit: "Send Enquiry",
    opt_millets: "Premium Millets", opt_seeds: "Seeds & Superfoods", opt_birdfeed: "Bird Feeds", opt_other: "Other Spices",
    btn_download: "Download Full PDF Catalog",
    contact_title: "Get in Touch",
    contact_desc: "Interested in bulk orders, exports, or have a general query? Fill out the form and our team will get back to you promptly."
  },
  jp: {
    nav_home: "ホーム", nav_about: "私たちについて", nav_why_us: "選ばれる理由", nav_products: "製品", nav_enquire: "お問い合わせ",
    hero_badge: "2010年創業 &bull; 政府認定輸出企業",
    hero_title_1: "自然の恵みを、",
    hero_title_2: "あなたのために",
    hero_subtitle: "インドの農地から世界へ輸出される最高級の雑穀、スーパーフード、スパイス。",
    btn_explore: "輸出製品を見る",
    ticker_1: "🟢 最近の出荷: 最高級雑穀200MT (東京, 日本)",
    ticker_2: "🟢 品質管理: 99.99% ソルテックス選別済みロット承認",
    ticker_3: "🟢 輸送中: アラブ首長国連邦ドバイへのコンテナ発送",
    ticker_4: "🟢 最近の出荷: スーパーフード50MT (ロンドン, 英国)",
    story_title_1: "持続可能な調達",
    story_desc_1: "インドの農家とのパートナーシップを通じて、自然から直接最高の雑穀、スパイス、スーパーフードを調達する持続可能な取り組みを推進しています。",
    story_title_2: "高度な加工処理",
    story_desc_2: "バンガロール近郊にある25,000平方フィートの広大な製造施設では、最先端技術を活用し、驚異的な99.99％の清浄度を達成しています。",
    story_title_3: "グローバル輸出",
    story_desc_3: "政府認定のスター・エクスポート・ハウスとして、100%天然の最高級製品を国際市場へタイムリーにお届けします。",
    map_kurnool_title: "カルヌール, インド",
    map_kurnool_desc: "グローバル・オペレーション・ハブ",
    form_name: "フルネーム", form_name_ph: "お名前", form_email: "メールアドレス", form_email_ph: "メールアドレス",
    form_interest: "ご希望の製品", form_msg: "メッセージ", form_submit: "お問い合わせを送信",
    opt_millets: "プレミアム雑穀", opt_seeds: "種子とスーパーフード", opt_birdfeed: "鳥の餌", opt_other: "その他のスパイス",
    btn_download: "PDFカタログをダウンロード",
    contact_title: "お問い合わせ",
    contact_desc: "大口注文、輸出に関するお問い合わせ、または一般的なご質問はございますか？ フォームにご記入いただければ、迅速に返答いたします。"
  },
  ar: {
    nav_home: "الرئيسية", nav_about: "معلومات عنا", nav_why_us: "لماذا نحن", nav_products: "منتجاتنا", nav_enquire: "استفسر الآن",
    hero_badge: "منذ عام 2010 &bull; شركة تصدير معتمدة حكومياً",
    hero_title_1: "حبوب الطبيعة،",
    hero_title_2: "تزرع من أجلك",
    hero_subtitle: "الدخن الممتاز والأطعمة الفائقة والتوابل المُصدرة عالمياً من المزارع الهندية إلى العالم.",
    btn_explore: "استكشف صادراتنا",
    ticker_1: "🟢 شحنة حديثة: 200 طن متري من الدخن الممتاز إلى طوكيو، اليابان",
    ticker_2: "🟢 مراقبة الجودة: دفعة معتمدة بنسبة نظافة 99.99% (سورتكس)",
    ticker_3: "🟢 في الطريق: إرسال حاوية إلى دبي، الإمارات العربية المتحدة",
    ticker_4: "🟢 شحنة حديثة: 50 طن متري من الأطعمة الفائقة إلى لندن، المملكة المتحدة",
    story_title_1: "مصادر مستدامة",
    story_desc_1: "من خلال الشراكات مع المزارعين الهنود، نشجع الممارسات المستدامة للحصول على أجود أنواع الدخن والتوابل والأطعمة الفائقة مباشرة من الطبيعة.",
    story_title_2: "معالجة متقدمة",
    story_desc_2: "يستخدم منشأتنا التصنيعية الواسعة التي تبلغ مساحتها 25,000 قدم مربع بالقرب من بنغالور أحدث التقنيات، محققة مستوى نظافة مذهل بنسبة 99.99٪.",
    story_title_3: "التصدير العالمي",
    story_desc_3: "بصفتنا شركة تصدير معترف بها حكومياً، نضمن التسليم في الوقت المناسب لمنتجات طبيعية وممتازة بنسبة 100٪ للأسواق الدولية.",
    map_kurnool_title: "كورنول، الهند",
    map_kurnool_desc: "مركز العمليات العالمية",
    form_name: "الاسم الكامل", form_name_ph: "اسمك", form_email: "البريد الإلكتروني", form_email_ph: "بريدك الإلكتروني",
    form_interest: "المنتج الذي يهمك", form_msg: "رسالتك", form_submit: "إرسال الاستفسار",
    opt_millets: "الدخن الممتاز", opt_seeds: "البذور والأطعمة الفائقة", opt_birdfeed: "تغذية الطيور", opt_other: "توابل أخرى",
    btn_download: "تحميل الكتالوج الكامل (PDF)",
    contact_title: "ابقى على تواصل",
    contact_desc: "مهتم بطلبات الجملة أو الصادرات أو لديك استفسار عام؟ املأ النموذج وسيقوم فريقنا بالرد عليك على الفور."
  }
}`;

jsContent = jsContent.replace(/const translations = \{[\s\S]*?\n\s*ar: \{[\s\S]*?\n\s*\}\n\};/, 'const translations = ' + newTranslations + ';');
fs.writeFileSync(jsPath, jsContent);
console.log("Translations updated!");
