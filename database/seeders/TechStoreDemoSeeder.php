<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Webkul\Attribute\Repositories\AttributeFamilyRepository;
use Webkul\Category\Repositories\CategoryRepository;
use Webkul\Core\Models\Channel;
use Webkul\Inventory\Models\InventorySource;
use Webkul\Product\Helpers\Indexers\Flat as FlatIndexer;
use Webkul\Product\Helpers\Indexers\Inventory as InventoryIndexer;
use Webkul\Product\Helpers\Indexers\Price as PriceIndexer;
use Webkul\Product\Models\ProductImage;
use Webkul\Product\Repositories\ProductRepository;

class TechStoreDemoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $this->command?->info('🚀 Bắt đầu tạo dữ liệu demo Đồ Công Nghệ & Phụ Kiện Cao Cấp...');

        $channel = core()->getDefaultChannel();
        $defaultLocale = $channel->default_locale->code ?? config('app.locale', 'en');
        $inventorySource = InventorySource::first();
        $attributeFamily = app(AttributeFamilyRepository::class)->findOneByField('code', 'default');
        $categoryRepository = app(CategoryRepository::class);
        $productRepository = app(ProductRepository::class);

        $rootCategory = $categoryRepository->getRootCategories()->first();

        // 1. Tạo các danh mục công nghệ
        $categoriesData = [
            [
                'name' => 'Flagship Smartphones',
                'slug' => 'flagship-smartphones',
                'description' => 'Điện thoại thông minh flagship cao cấp hàng đầu thế giới với hiệu năng đỉnh cao, chip thế hệ mới nhất và camera chuyên nghiệp.',
                'position' => 1,
            ],
            [
                'name' => 'Fast Chargers & GaN',
                'slug' => 'fast-chargers-gan',
                'description' => 'Củ sạc nhanh công nghệ GaN công suất cao 65W - 140W - 240W, sạc đa thiết bị cho Smartphone và Laptop.',
                'position' => 2,
            ],
            [
                'name' => 'Power Banks',
                'slug' => 'power-banks',
                'description' => 'Pin sạc dự phòng dung lượng khủng 20.000mAh - 30.000mAh, sạc nhanh công suất lớn thiết kế trong suốt Cyberpunk.',
                'position' => 3,
            ],
            [
                'name' => 'Audio & Gaming Earbuds',
                'slug' => 'audio-gaming-earbuds',
                'description' => 'Tai nghe True Wireless chống ồn chủ động ANC đỉnh cao, chuẩn âm thanh Hi-Res LDAC và tai nghe Gaming siêu nhạy không độ trễ.',
                'position' => 4,
            ],
            [
                'name' => 'Phone Coolers & Gaming Gear',
                'slug' => 'phone-coolers-gaming-gear',
                'description' => 'Sò lạnh tản nhiệt Gaming công suất 27W - 36W từ tính, giảm nhiệt tức thì 0 độ C cho điện thoại chơi game cấu hình tối đa.',
                'position' => 5,
            ],
            [
                'name' => 'Thunderbolt Cables & Hubs',
                'slug' => 'cables-and-hubs',
                'description' => 'Cáp sạc siêu bền bọc dù Type-C Thunderbolt 4 240W truyền dữ liệu 40Gbps và Hub mở rộng đa cổng chuẩn cao cấp.',
                'position' => 6,
            ],
            [
                'name' => 'Tough Cases & Screen Protectors',
                'slug' => 'cases-and-protectors',
                'description' => 'Ốp lưng chống sốc tiêu chuẩn quân đội sợi Kevlar MagSafe và Kính cường lực sapphire siêu cứng chống trầy xước.',
                'position' => 7,
            ],
        ];

        $createdCategories = [];

        foreach ($categoriesData as $catData) {
            $existing = $categoryRepository->findBySlug($catData['slug']);
            if (! $existing) {
                $payload = [
                    'position'  => $catData['position'],
                    'status'    => 1,
                    'parent_id' => $rootCategory->id,
                ];

                foreach (core()->getAllLocales() as $loc) {
                    $payload[$loc->code] = [
                        'name'             => $catData['name'],
                        'slug'             => $catData['slug'],
                        'description'      => $catData['description'],
                        'meta_title'       => $catData['name'],
                        'meta_description' => $catData['description'],
                    ];
                }

                $category = $categoryRepository->create($payload);
                $createdCategories[$catData['slug']] = $category->id;

                // Tạo ảnh danh mục
                $catDir = storage_path('app/public/category/' . $category->id);
                if (! file_exists($catDir)) {
                    mkdir($catDir, 0755, true);
                }
                $catImgPath = 'category/' . $category->id . '/image.png';
                $this->generateCategoryImage(storage_path('app/public/' . $catImgPath), $catData['name']);
                $category->update([
                    'logo_path' => $catImgPath,
                    'banner_path' => $catImgPath,
                ]);

                $this->command?->info("  + Tạo danh mục: {$catData['name']}");
            } else {
                $createdCategories[$catData['slug']] = $existing->id;
                if (! $existing->image) {
                    $catDir = storage_path('app/public/category/' . $existing->id);
                    if (! file_exists($catDir)) {
                        mkdir($catDir, 0755, true);
                    }
                    $catImgPath = 'category/' . $existing->id . '/image.png';
                    $this->generateCategoryImage(storage_path('app/public/' . $catImgPath), $catData['name']);
                    $existing->update([
                        'logo_path' => $catImgPath,
                        'banner_path' => $catImgPath,
                    ]);
                }
            }
        }

        \Illuminate\Database\Eloquent\Model::reguard();

        // 2. Danh sách sản phẩm công nghệ chi tiết
        $products = [
            // --- FLAGSHIP SMARTPHONES ---
            [
                'sku' => 'PHONE-IP16PM-256',
                'name' => 'iPhone 16 Pro Max 256GB Titanium Tự Nhiên',
                'category' => 'flagship-smartphones',
                'price' => 1199.00,
                'special_price' => 1129.00,
                'badge' => 'Chip A18 Pro | Camera 48MP | Titanium',
                'bg_color' => [30, 32, 40],
                'short_description' => 'Flagship cao cấp nhất của Apple với khung viền Titan cấp 5 siêu nhẹ, chip A18 Pro tiến trình 3nm tối tân và nút Camera Control cảm ứng lực mới.',
                'specs' => [
                    'Màn hình' => '6.9 inch Super Retina XDR OLED 120Hz ProMotion',
                    'Vi xử lý' => 'Apple A18 Pro (3nm), CPU 6 lõi, GPU 6 lõi',
                    'Bộ nhớ & RAM' => '256GB NVMe, 8GB RAM',
                    'Camera chính' => '48MP Fusion + 48MP Ultra-wide + 12MP Tele 5x Optical Zoom',
                    'Pin & Sạc' => '4.685 mAh, Sạc nhanh PD 30W, MagSafe 25W',
                    'Chất liệu' => 'Khung Titan cấp 5, Mặt kính Ceramic Shield thế hệ mới',
                ],
            ],
            [
                'sku' => 'PHONE-S24U-512',
                'name' => 'Samsung Galaxy S24 Ultra 5G 512GB Titanium Gray',
                'category' => 'flagship-smartphones',
                'price' => 1299.00,
                'special_price' => 1199.00,
                'badge' => 'Snapdragon 8 Gen 3 | Galaxy AI | Bút S-Pen',
                'bg_color' => [25, 30, 48],
                'short_description' => 'Đỉnh cao công nghệ Android tích hợp quyền năng Galaxy AI toàn diện, màn hình phẳng chống chói Dynamic AMOLED 2X 2600 nits kèm bút S-Pen quyền năng.',
                'specs' => [
                    'Màn hình' => '6.8 inch Dynamic AMOLED 2X QHD+ 120Hz 2600 nits Corning Gorilla Armor',
                    'Vi xử lý' => 'Snapdragon 8 Gen 3 for Galaxy (4nm)',
                    'Bộ nhớ & RAM' => '512GB UFS 4.0, 12GB RAM LPDDR5X',
                    'Camera chính' => '200MP OIS + 50MP Periscope 5x + 10MP Tele 3x + 12MP Ultrawide',
                    'Pin & Sạc' => '5.000 mAh, Sạc siêu nhanh 45W 2.0',
                    'Tính năng đặc biệt' => 'Galaxy AI dịch trực tiếp, Khoanh vùng tìm kiếm, Khung viền Titanium',
                ],
            ],
            [
                'sku' => 'PHONE-ROG8PRO-512',
                'name' => 'ASUS ROG Phone 8 Pro 16GB/512GB Gaming Snapdragon 8 Gen 3',
                'category' => 'flagship-smartphones',
                'price' => 1099.00,
                'special_price' => 999.00,
                'badge' => 'Màn 165Hz LTPO | Tản nhiệt GameCool 8 | AirTrigger',
                'bg_color' => [20, 20, 28],
                'short_description' => 'Quái vật Gaming Phone hàng đầu với màn hình AMOLED 165Hz siêu mượt, hệ thống phím cảm ứng siêu âm AirTrigger và tản nhiệt buồng hơi 3D GameCool 8.',
                'specs' => [
                    'Màn hình' => '6.78 inch Samsung E6 Flexible AMOLED 165Hz LTPO 2500 nits',
                    'Vi xử lý' => 'Snapdragon 8 Gen 3 xung nhịp 3.3GHz',
                    'Bộ nhớ & RAM' => '16GB LPDDR5X RAM, 512GB UFS 4.0',
                    'Đèn LED' => 'Màn hình phụ AniMe Vision 341 đèn mini-LED tùy biến',
                    'Pin & Sạc' => '5.500 mAh, Sạc siêu tốc HyperCharge 65W, Sạc không dây Qi 15W',
                    'Tính năng Gaming' => 'AirTrigger 8, Cổng USB-C kép (cạnh bên & đáy), Kháng nước IP68',
                ],
            ],
            [
                'sku' => 'PHONE-XM14U-512',
                'name' => 'Xiaomi 14 Ultra 16GB/512GB Leica Quad Camera 1-inch Sensor',
                'category' => 'flagship-smartphones',
                'price' => 1149.00,
                'special_price' => 1049.00,
                'badge' => 'Cảm biến 1-inch LYT-900 | Ống kính Leica Summilux',
                'bg_color' => [35, 25, 25],
                'short_description' => 'Đỉnh cao nhiếp ảnh di động phối hợp cùng huyền thoại Leica với cụm 4 camera 50MP cảm biến 1-inch khẩu độ vô cấp mượt mà.',
                'specs' => [
                    'Màn hình' => '6.73 inch LTPO AMOLED WQHD+ 120Hz 3000 nits Dolby Vision',
                    'Vi xử lý' => 'Qualcomm Snapdragon 8 Gen 3',
                    'Bộ nhớ & RAM' => '16GB LPDDR5X RAM, 512GB UFS 4.0',
                    'Camera Leica' => '50MP LYT-900 1-inch OIS khẩu độ thay đổi f/1.63 - f/4.0',
                    'Pin & Sạc' => '5.000 mAh, Sạc nhanh có dây 90W HyperCharge, Sạc không dây 80W',
                ],
            ],

            // --- SẠC NHANH GAN & TRẠM SẠC ---
            [
                'sku' => 'CHG-ANKER-737-140W',
                'name' => 'Củ Sạc GaN Anker 737 GaNPrime 140W 3 Cổng (A2341)',
                'category' => 'fast-chargers-gan',
                'price' => 99.99,
                'special_price' => 84.99,
                'badge' => 'GaNPrime 140W | PowerIQ 4.0 | 2x USB-C + 1x USB-A',
                'bg_color' => [15, 30, 45],
                'short_description' => 'Củ sạc công nghệ GaN tiên tiến nhất của Anker với công suất cực đại 140W chuẩn PD 3.1, đủ sức sạc nhanh tối đa cho cả MacBook Pro 16 inch và 2 iPhone cùng lúc.',
                'specs' => [
                    'Tổng công suất' => '140W Max (Hỗ trợ chuẩn USB Power Delivery 3.1)',
                    'Cổng kết nối' => '2 x USB-C (140W max per port), 1 x USB-A (22.5W)',
                    'Công nghệ' => 'GaNPrime, ActiveShield 2.0 kiểm soát nhiệt 3 triệu lần/ngày',
                    'Tương thích' => 'MacBook Pro, Dell XPS, iPhone 16/15, Samsung 45W Super Fast Charging 2.0',
                    'Kích thước' => 'Nhỏ hơn 39% so với củ sạc Apple 140W tiêu chuẩn',
                ],
            ],
            [
                'sku' => 'CHG-BASEUS-BLADE-100W',
                'name' => 'Củ Sạc Siêu Mỏng Baseus Blade HD GaN 100W PD 3.0 & QC 4.0',
                'category' => 'fast-chargers-gan',
                'price' => 69.99,
                'special_price' => 54.99,
                'badge' => 'Ultra Slim 18mm | 100W Dual Type-C | Màn hình LED',
                'bg_color' => [25, 35, 40],
                'short_description' => 'Thiết kế dẹp siêu mỏng chỉ 18mm dễ dàng đút vừa balo túi xách, công suất mạnh mẽ 100W chia nguồn thông minh cho 4 cổng.',
                'specs' => [
                    'Công suất' => '100W Max',
                    'Cổng ra' => '2x Type-C (100W), 2x USB-A (30W)',
                    'Độ mỏng' => 'Chỉ 1.8cm thiết kế dạng thẻ Card siêu gọn',
                    'Bảo vệ' => 'Tự ngắt khi đầy, chống quá áp, quá dòng, quá nhiệt chuẩn quốc tế',
                ],
            ],
            [
                'sku' => 'CHG-UGREEN-NEXODE-300W',
                'name' => 'Trạm Sạc Để Bàn Ugreen Nexode GaN 300W 5 Cổng Sạc 3 Laptop',
                'category' => 'fast-chargers-gan',
                'price' => 199.99,
                'special_price' => 169.99,
                'badge' => '300W Khủng Nhất | 4x USB-C + 1x USB-A | PD 3.1 140W Port',
                'bg_color' => [18, 25, 38],
                'short_description' => 'Trạm sạc để bàn uy lực nhất hành tinh, có thể sạc cùng lúc 3 chiếc Laptop công suất cao và 2 điện thoại di động ở tốc độ tối đa.',
                'specs' => [
                    'Công suất tổng' => '300W Max',
                    'Cổng chính Type-C1' => '140W Max độc lập chuẩn PD 3.1',
                    'Chip GaN' => 'GaNFast thế hệ III tối ưu hiệu suất 95%',
                    'Chân cắm' => 'Dây nguồn nối dài 2m cắm ổ điện bàn làm việc',
                ],
            ],

            // --- PIN SẠC DỰ PHÒNG ---
            [
                'sku' => 'PB-SHARGEEK-STORM2-100W',
                'name' => 'Pin Dự Phòng Shargeek Storm 2 25600mAh 100W Trong Suốt IPS Screen',
                'category' => 'power-banks',
                'price' => 219.00,
                'special_price' => 189.00,
                'badge' => 'Cyberpunk Trong Suốt | Màn hình IPS màu | DC 75W Out',
                'bg_color' => [10, 35, 30],
                'short_description' => 'Kiệt tác pin sạc dự phòng vỏ trong suốt đậm chất Cyberpunk, màn hình màu IPS hiển thị chi tiết điện áp, dòng điện, nhiệt độ và công suất theo thời gian thực.',
                'specs' => [
                    'Dung lượng' => '25.600 mAh / 93.5Wh (Chuẩn quy định hàng không mang lên máy bay)',
                    'Công suất Type-C' => '100W Max PD In/Out (Sạc đầy lại pin chỉ 90 phút)',
                    'Cổng điều chỉnh DC' => '3.3V - 25.2V tùy chỉnh công suất lên tới 75W',
                    'Màn hình' => 'IPS 1.14 inch hiển thị thông số điện năng thời gian thực',
                    'Cell pin' => '8 lõi pin 18650 chuẩn xe điện Tesla cao cấp',
                ],
            ],
            [
                'sku' => 'PB-ANKER-PRIME-20000',
                'name' => 'Pin Dự Phòng Anker Prime 20000mAh 200W Output Đa Năng',
                'category' => 'power-banks',
                'price' => 129.99,
                'special_price' => 109.99,
                'badge' => '200W Tổng Công Suất | Màn hình kỹ thuật số Smart Screen',
                'bg_color' => [20, 25, 45],
                'short_description' => 'Thiết kế dạng trụ đứng hiện đại với 2 cổng USB-C 100W cho phép sạc đồng thời 2 chiếc laptop MacBook Pro ở tốc độ 100W mỗi máy.',
                'specs' => [
                    'Dung lượng' => '20.000 mAh',
                    'Công suất ra cực đại' => '200W (100W + 100W cổng kép)',
                    'Cổng kết nối' => '2x USB-C (100W), 1x USB-A (65W)',
                    'Màn hình' => 'Màn hình Smart Display màu hiển thị tình trạng pin & công suất',
                ],
            ],

            // --- TAI NGHE & GAMING AUDIO ---
            [
                'sku' => 'EAR-SONY-WF1000XM5',
                'name' => 'Tai Nghe Sony WF-1000XM5 Chống Ồn Đầu Bảng Hi-Res LDAC',
                'category' => 'audio-gaming-earbuds',
                'price' => 299.99,
                'special_price' => 249.99,
                'badge' => 'Bộ xử lý V2 & QN2e | Driver Dynamic X 8.4mm | LDAC',
                'bg_color' => [30, 28, 25],
                'short_description' => 'Tai nghe True Wireless có khả năng chống ồn chủ động tốt nhất thị trường hiện nay, màng loa Dynamic Driver X thế hệ mới tái tạo dải âm trầm sâu lắng và chi tiết sắc nét.',
                'specs' => [
                    'Chống ồn' => 'Bộ xử lý tích hợp V2 và bộ xử lý khử tiếng ồn HD QN2e kép',
                    'Chuẩn âm thanh' => 'Hi-Res Audio Wireless, LDAC, DSEE Extreme AI',
                    'Thời lượng pin' => '8 giờ (bật chống ồn) + 16 giờ từ hộp sạc (tổng 24 giờ)',
                    'Micro đàm thoại' => 'Cảm biến dẫn truyền xương và thuật toán AI lọc gió cực nét',
                    'Kháng nước' => 'Chuẩn IPX4 chống mồ hôi và mưa nhẹ',
                ],
            ],
            [
                'sku' => 'EAR-ROG-CETRA-SPEEDNOVA',
                'name' => 'Tai Nghe Gaming ROG Cetra True Wireless SpeedNova 2.4GHz',
                'category' => 'audio-gaming-earbuds',
                'price' => 199.99,
                'special_price' => 179.99,
                'badge' => 'Không Độ Trễ 2.4GHz Dongle | Đèn RGB Aura Sync | ANC',
                'bg_color' => [35, 15, 25],
                'short_description' => 'Vũ khí âm thanh tối thượng cho game thủ với kết nối sóng kép 2.4GHz siêu tốc qua Dongle Type-C loại bỏ hoàn toàn hiện tượng trễ tiếng khi chơi game FPS/MOBA.',
                'specs' => [
                    'Kết nối kép' => 'Không dây 2.4GHz ROG SpeedNova (qua USB-C Dongle) & Bluetooth 5.3',
                    'Âm thanh' => 'Âm thanh không gian 24-bit 96kHz độ phân giải cao',
                    'Chống ồn' => 'Adaptive Hybrid ANC thích ứng môi trường',
                    'Micro' => 'Micro AI Bone-Conduction thu âm giọng nói siêu rõ',
                    'Thời lượng pin' => 'Lên tới 46 giờ sử dụng liên tục (chế độ Bluetooth)',
                ],
            ],

            // --- SÒ LẠNH TẢN NHIỆT GAMING PHONE ---
            [
                'sku' => 'COOL-REDMAGIC-5PRO',
                'name' => 'Sò Lạnh Tản Nhiệt Từ Tính RedMagic Magnetic Cooler 5 Pro 36W',
                'category' => 'phone-coolers-gaming-gear',
                'price' => 59.99,
                'special_price' => 49.99,
                'badge' => 'Công Suất 36W Cực Đại | Hạ Âm 12 Độ C | Đèn LED RGB',
                'bg_color' => [15, 20, 35],
                'short_description' => 'Sò lạnh tản nhiệt điện thoại mạnh nhất thế giới với công suất đóng băng 36W, nam châm từ tính MagSafe hít chặt lưng máy làm mát tức thì trong 3 giây.',
                'specs' => [
                    'Công suất' => '36W Max (Yêu cầu củ sạc nhanh từ 9V/3A trở lên)',
                    'Khả năng làm lạnh' => 'Hạ nhiệt độ bề mặt xuống dưới -12°C, chống tụt FPS khi chơi Genshin Impact / Warzone',
                    'Lắp đặt' => 'Từ tính MagSafe trực tiếp cho iPhone hoặc kẹp rời đi kèm cho Android',
                    'Điều khiển' => 'Kết nối Bluetooth qua App chỉnh tốc độ quạt và dải LED RGB 16.8 triệu màu',
                ],
            ],
            [
                'sku' => 'COOL-BLACKSHARK-4PRO',
                'name' => 'Quạt Sò Lạnh Black Shark FunCooler 4 Pro 27W Lạnh Đóng Băng',
                'category' => 'phone-coolers-gaming-gear',
                'price' => 45.00,
                'special_price' => 38.00,
                'badge' => 'Làm Lạnh TEC 27W | Cánh Quạt 7 Cánh | Màn Hình LED Nhiệt Độ',
                'bg_color' => [10, 30, 20],
                'short_description' => 'Tản nhiệt bán dẫn TEC diện tích lớn của Black Shark, tích hợp màn hình LED đo nhiệt độ thời gian thực hiển thị độ lạnh ngay trên thân máy.',
                'specs' => [
                    'Công suất' => '27W TEC Cooling Engine',
                    'Độ ồn' => 'Siêu êm ái dưới 35dB không ảnh hưởng đàm thoại mic trong game',
                    'Màn hình' => 'LED hiển thị nhiệt độ làm mát thực tế',
                    'Cơ chế kẹp' => 'Ngàm kẹp đệm silicon co giãn tương thích mọi dòng điện thoại 67mm - 88mm',
                ],
            ],

            // --- CÁP SẠC & HUB CHUYỂN ĐỔI ---
            [
                'sku' => 'CAB-UGREEN-TB4-240W',
                'name' => 'Cáp Sạc & Dữ Liệu Ugreen Thunderbolt 4 Type-C 240W 40Gbps 8K',
                'category' => 'cables-and-hubs',
                'price' => 34.99,
                'special_price' => 27.99,
                'badge' => 'Thunderbolt 4 | 240W EPR | 40Gbps | Xuất hình 8K@60Hz',
                'bg_color' => [20, 25, 30],
                'short_description' => 'Sợi cáp đa năng đỉnh cao hỗ trợ truyền hình ảnh 8K UHD, truyền tệp siêu tốc 40Gbps trong nháy mắt và sạc công suất khủng 240W.',
                'specs' => [
                    'Băng thông' => '40Gbps truyền file 10GB trong 3 giây',
                    'Công suất sạc' => '240W (48V/5A) chuẩn USB Power Delivery Extended Power Range (EPR)',
                    'Xuất hình ảnh' => '1 màn hình 8K@60Hz hoặc 2 màn hình 4K@60Hz',
                    'Độ bền' => 'Đầu bọc hợp kim nhôm, thân cáp bọc sợi nylon bện chống đứt gãy 20.000 lần uốn',
                ],
            ],

            // --- ỐP LƯNG & CƯỜNG LỰC CAO CẤP ---
            [
                'sku' => 'CASE-UAG-MONARCH-PRO',
                'name' => 'Ốp Lưng UAG Monarch Pro Kevlar MagSafe Chống Va Đập Quân Đội',
                'category' => 'cases-and-protectors',
                'price' => 79.95,
                'special_price' => 69.95,
                'badge' => 'Sợi DuPont Kevlar | MagSafe Cường Lực | Rơi 7.6m Chuẩn Quân Đội',
                'bg_color' => [30, 20, 20],
                'short_description' => 'Ốp lưng giáp bảo vệ huyền thoại kết hợp 5 lớp vật liệu cao cấp gồm sợi DuPont Kevlar chính hãng, nam châm MagSafe siêu mạnh và viền đệm chống sốc tổ ong.',
                'specs' => [
                    'Chống sốc' => 'Thử nghiệm rơi thả từ độ cao 7.6 mét (Chuẩn quân đội MIL-STD 810G 516.6)',
                    'Chất liệu' => 'Vật liệu sợi Kevlar gia cường, khung kim loại và cao su TPU chống trượt',
                    'MagSafe' => 'Tích hợp vòng nam châm Neodymium N52 lực hút cực mạnh',
                    'Bảo vệ camera' => 'Viền bezel nhô cao bảo vệ trọn vẹn cụm ống kính camera đắt giá',
                ],
            ],
            [
                'sku' => 'GLASS-BELKIN-SAPPHIRE',
                'name' => 'Kính Cường Lực Belkin UltraGlass 2 Chống Nhìn Trộm Siêu Cứng 9H+',
                'category' => 'cases-and-protectors',
                'price' => 39.99,
                'special_price' => 32.99,
                'badge' => 'UltraGlass 2 Công Nghệ Đức | Chống Nhìn Trộm 2 Chiều | Khay Dán Tự Căn',
                'bg_color' => [20, 30, 35],
                'short_description' => 'Kính cường lực mỏng nhẹ chỉ 0.29mm gia cường bằng công nghệ trao đổi ion kép từ Đức, cứng hơn gấp 2.7 lần so với kính cường lực thông thường.',
                'specs' => [
                    'Độ cứng' => '9H+ Ion-Exchange Glass gia cường 2 lần',
                    'Bảo mật' => 'Lớp lọc góc nhìn 2 chiều 28 độ chống nhìn trộm nơi công cộng',
                    'Cảm ứng' => 'Độ mỏng 0.29mm giữ trọn 100% độ nhạy cảm ứng và Face ID mượt mà',
                    'Kèm khay Easy Align' => 'Tự căn chỉnh dán không bọt khí chuẩn xác 100% tại nhà',
                ],
            ],
        ];

        // 3. Tiến hành tạo sản phẩm
        $createdProductIds = [];
        $imageStoragePath = storage_path('app/public/product');

        if (! file_exists($imageStoragePath)) {
            mkdir($imageStoragePath, 0755, true);
        }

        foreach ($products as $pData) {
            $sku = $pData['sku'];
            $existingProduct = $productRepository->findOneByField('sku', $sku);

            if ($existingProduct) {
                $this->command?->info("  - Bỏ qua đã tồn tại: {$pData['name']}");
                $createdProductIds[] = $existingProduct->id;

                if (! $existingProduct->images()->count()) {
                    $prodImgDir = $imageStoragePath . '/' . $existingProduct->id;
                    if (! file_exists($prodImgDir)) {
                        mkdir($prodImgDir, 0755, true);
                    }
                    $imgRelPath = 'product/' . $existingProduct->id . '/main.png';
                    $imgAbsPath = storage_path('app/public/' . $imgRelPath);

                    $this->generateTechProductImage(
                        $imgAbsPath,
                        $pData['name'],
                        $pData['badge'],
                        $pData['price'],
                        $pData['bg_color'] ?? [24, 28, 38]
                    );

                    ProductImage::create([
                        'type'       => 'images',
                        'path'       => $imgRelPath,
                        'product_id' => $existingProduct->id,
                        'position'   => 1,
                    ]);
                }
                continue;
            }

            // Tạo base product
            $product = $productRepository->create([
                'type' => 'simple',
                'attribute_family_id' => $attributeFamily->id,
                'sku' => $sku,
            ]);

            // Tạo mô tả HTML chi tiết
            $htmlDesc = '<div class="tech-product-detail" style="font-family: inherit; line-height: 1.6;">';
            $htmlDesc .= '<p style="font-size: 16px; margin-bottom: 16px;">' . e($pData['short_description']) . '</p>';
            $htmlDesc .= '<h3 style="font-size: 18px; font-weight: bold; margin-top: 24px; margin-bottom: 12px; color: #111827;">Thông Số Kỹ Thuật Chi Tiết</h3>';
            $htmlDesc .= '<table style="width: 100%; border-collapse: collapse; border: 1px solid #e5e7eb; margin-bottom: 24px; border-radius: 8px; overflow: hidden;">';
            $htmlDesc .= '<tbody>';
            $rowIndex = 0;
            foreach ($pData['specs'] as $specKey => $specVal) {
                $rowBg = ($rowIndex % 2 === 0) ? '#f9fafb' : '#ffffff';
                $htmlDesc .= '<tr style="background-color: ' . $rowBg . '; border-bottom: 1px solid #e5e7eb;">';
                $htmlDesc .= '<td style="padding: 10px 16px; font-weight: 600; width: 35%; color: #374151; font-size: 14px;">' . e($specKey) . '</td>';
                $htmlDesc .= '<td style="padding: 10px 16px; color: #4b5563; font-size: 14px;">' . e($specVal) . '</td>';
                $htmlDesc .= '</tr>';
                $rowIndex++;
            }
            $htmlDesc .= '</tbody></table>';
            $htmlDesc .= '<div style="background: #eff6ff; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 4px; margin-top: 16px;">';
            $htmlDesc .= '<p style="margin: 0; color: #1e40af; font-size: 13px; font-weight: 500;">✓ Sản phẩm chính hãng mới 100% nguyên seal | Bảo hành điện tử 12-24 tháng toàn quốc | Đổi mới 30 ngày nếu lỗi NSX</p>';
            $htmlDesc .= '</div></div>';

            $catId = $createdCategories[$pData['category']] ?? $rootCategory->id;
            $urlKey = Str::slug($pData['name']) . '-' . Str::lower(Str::random(4));

            $updateData = [
                'channel'              => $channel->code,
                'locale'               => $defaultLocale,
                'sku'                  => $sku,
                'name'                 => $pData['name'],
                'url_key'              => $urlKey,
                'price'                => $pData['price'],
                'cost'                 => round($pData['price'] * 0.75, 2),
                'special_price'        => $pData['special_price'],
                'special_price_from'   => '2025-01-01',
                'special_price_to'     => '2027-12-31',
                'weight'               => 0.35,
                'status'               => 1,
                'visible_individually' => 1,
                'new'                  => 1,
                'featured'             => 1,
                'guest_checkout'       => 1,
                'short_description'    => '<p>' . e($pData['short_description']) . '</p>',
                'description'          => $htmlDesc,
                'inventories'          => [
                    $inventorySource->id => rand(35, 120),
                ],
                'categories'           => [$catId],
                'channels'             => [$channel->id],
            ];

            // Cập nhật thông tin sản phẩm
            $productRepository->update($updateData, $product->id);

            // Tạo ảnh sản phẩm chất lượng cao với GD
            $prodImgDir = $imageStoragePath . '/' . $product->id;
            if (! file_exists($prodImgDir)) {
                mkdir($prodImgDir, 0755, true);
            }

            $imgRelPath = 'product/' . $product->id . '/main.png';
            $imgAbsPath = storage_path('app/public/' . $imgRelPath);

            $this->generateTechProductImage(
                $imgAbsPath,
                $pData['name'],
                $pData['badge'],
                $pData['price'],
                $pData['bg_color'] ?? [24, 28, 38]
            );

            // Ghi vào bảng product_images
            ProductImage::create([
                'type'       => 'images',
                'path'       => $imgRelPath,
                'product_id' => $product->id,
                'position'   => 1,
            ]);

            // Dispatch event để trigger indexer
            Event::dispatch('catalog.product.update.after', $product);

            $createdProductIds[] = $product->id;
            $this->command?->info("  + Đã tạo SP: {$pData['name']} (Giá: \${$pData['price']})");
        }

        // 4. Chạy Re-Index Flat, Price và Inventory để hiển thị ngay tức thì
        $this->command?->info('⚙️ Đang đồng bộ và chỉ mục dữ liệu (Indexers)...');
        app(FlatIndexer::class)->reindexFull();
        app(PriceIndexer::class)->reindexFull();
        app(InventoryIndexer::class)->reindexFull();

        // 5. Cấu hình Theme Homepage hiển thị các danh mục và sản phẩm vừa tạo
        $this->updateHomePageThemeCustomizations($createdCategories, $createdProductIds);

        $this->command?->info('✅ Hoàn tất tạo dữ liệu demo công nghệ cao cấp!');
    }

    /**
     * Tạo ảnh demo sản phẩm công nghệ bằng thư viện GD
     */
    protected function generateTechProductImage(string $filePath, string $name, string $badge, float $price, array $bgRgb): void
    {
        $w = 800;
        $h = 800;
        $im = imagecreatetruecolor($w, $h);

        // Nền chuyển màu nhẹ
        $r1 = $bgRgb[0]; $g1 = $bgRgb[1]; $b1 = $bgRgb[2];
        $r2 = max(0, $r1 - 12); $g2 = max(0, $g1 - 12); $b2 = max(0, $b1 - 12);

        for ($y = 0; $y < $h; $y++) {
            $ratio = $y / $h;
            $r = (int) ($r1 * (1 - $ratio) + $r2 * $ratio);
            $g = (int) ($g1 * (1 - $ratio) + $g2 * $ratio);
            $b = (int) ($b1 * (1 - $ratio) + $b2 * $ratio);
            $color = imagecolorallocate($im, $r, $g, $b);
            imageline($im, 0, $y, $w, $y, $color);
        }

        // Vẽ khung đồ hoạ neon tech
        $cyan = imagecolorallocate($im, 6, 182, 212);
        $blue = imagecolorallocate($im, 59, 130, 246);
        $purple = imagecolorallocate($im, 168, 85, 247);
        $white = imagecolorallocate($im, 255, 255, 255);
        $gray = imagecolorallocate($im, 156, 163, 175);
        $darkBox = imagecolorallocate($im, (int) ($r1 * 0.7), (int) ($g1 * 0.7), (int) ($b1 * 0.7));

        // Bo góc trung tâm
        imagefilledrectangle($im, 60, 60, 740, 740, $darkBox);
        imagerectangle($im, 60, 60, 740, 740, $cyan);

        // Biểu tượng công nghệ trung tâm (Hộp phối cảnh 3D giả lập)
        imagefilledellipse($im, 400, 360, 300, 300, imagecolorallocate($im, (int) ($r1 + 10), (int) ($g1 + 10), (int) ($b1 + 15)));
        imageellipse($im, 400, 360, 304, 304, $blue);
        imageellipse($im, 400, 360, 320, 320, $purple);

        // Icon thiết bị hình học
        imagefilledrectangle($im, 340, 260, 460, 460, imagecolorallocate($im, 15, 23, 42));
        imagerectangle($im, 340, 260, 460, 460, $cyan);
        imagefilledellipse($im, 400, 340, 50, 50, $cyan);

        // Nhãn Badge đỉnh cao
        imagefilledrectangle($im, 120, 100, 680, 140, imagecolorallocate($im, 15, 23, 42));
        imagerectangle($im, 120, 100, 680, 140, $cyan);
        imagestring($im, 5, 140, 112, "TECH FLAGSHIP • " . mb_strimwidth($badge, 0, 45, '...'), $cyan);

        // Tên sản phẩm
        $shortName = mb_strimwidth($name, 0, 42, '...');
        imagestring($im, 5, 100, 560, $shortName, $white);

        // Dòng giá và bảo hành
        imagestring($im, 5, 100, 600, "ORIGINAL SPEC • PRICE: $" . number_format($price, 2), $cyan);
        imagestring($im, 4, 100, 640, "Official Warranty | 100% Genuine Certified", $gray);

        imagepng($im, $filePath, 8);
        imagedestroy($im);
    }

    /**
     * Tạo ảnh danh mục công nghệ
     */
    protected function generateCategoryImage(string $filePath, string $name): void
    {
        $w = 600;
        $h = 400;
        $im = imagecreatetruecolor($w, $h);

        $bg = imagecolorallocate($im, 15, 23, 42);
        imagefilledrectangle($im, 0, 0, $w, $h, $bg);

        $cyan = imagecolorallocate($im, 6, 182, 212);
        $blue = imagecolorallocate($im, 59, 130, 246);
        $white = imagecolorallocate($im, 255, 255, 255);
        $gray = imagecolorallocate($im, 148, 163, 184);

        // Khung viền và gradient shape
        imagerectangle($im, 20, 20, 580, 380, $cyan);
        imageellipse($im, 300, 180, 220, 220, $blue);
        imageellipse($im, 300, 180, 200, 200, $cyan);

        // Text
        $shortName = mb_strimwidth($name, 0, 30, '...');
        imagestring($im, 5, 40, 290, "CATEGORY", $cyan);
        imagestring($im, 5, 40, 320, strtoupper($shortName), $white);
        imagestring($im, 4, 40, 350, "High-Spec & Flagship Collection", $gray);

        imagepng($im, $filePath, 8);
        imagedestroy($im);
    }

    /**
     * Tự động điều chỉnh Theme Sections để trang chủ hiển thị đẹp mắt
     */
    protected function updateHomePageThemeCustomizations(array $categories, array $productIds): void
    {
        $channel = core()->getDefaultChannel();
        $locale = $channel->default_locale->code ?? 'en';
        $now = Carbon::now();

        // 1. Cập nhật Banner / Image Carousel đầu trang
        $carouselSection = DB::table('theme_sections')->where('type', 'image_carousel')->first();
        if ($carouselSection) {
            DB::table('theme_section_translations')
                ->where('section_id', $carouselSection->id)
                ->update([
                    'options' => json_encode([
                        'images' => [
                            [
                                'title' => 'Flagship Smartphones 2025 - Hiệu Năng Vô Song',
                                'link'  => 'flagship-smartphones',
                                'image' => '',
                            ],
                            [
                                'title' => 'Sạc Nhanh GaN 140W & Trạm Sạc Siêu Tốc',
                                'link'  => 'fast-chargers-gan',
                                'image' => '',
                            ],
                            [
                                'title' => 'Tai Nghe Chống Ồn & Gaming Gear Đỉnh Cao',
                                'link'  => 'audio-gaming-earbuds',
                                'image' => '',
                            ],
                        ],
                    ]),
                ]);
        }

        // 2. Thêm hoặc cập nhật các Product Carousels cho trang chủ
        $productCarousel = DB::table('theme_sections')->where('type', 'product_carousel')->first();
        if ($productCarousel) {
            DB::table('theme_section_translations')
                ->where('section_id', $productCarousel->id)
                ->update([
                    'options' => json_encode([
                        'title' => 'Sản Phẩm Công Nghệ Mới & Bán Chạy Nhất',
                        'filters' => [
                            'sort'  => 'created_at-desc',
                            'limit' => 12,
                        ],
                    ]),
                ]);
        }

        // 3. Category Carousel
        $categoryCarousel = DB::table('theme_sections')->where('type', 'category_carousel')->first();
        if ($categoryCarousel) {
            DB::table('theme_section_translations')
                ->where('section_id', $categoryCarousel->id)
                ->update([
                    'options' => json_encode([
                        'title' => 'Danh Mục Công Nghệ Nổi Bật',
                        'filters' => [
                            'parent_id' => 1,
                            'sort'      => 'asc',
                            'limit'     => 8,
                        ],
                    ]),
                ]);
        }
    }
}
