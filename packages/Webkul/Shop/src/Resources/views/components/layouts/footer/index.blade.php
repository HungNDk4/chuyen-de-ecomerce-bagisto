{!! view_render_event('bagisto.shop.layout.footer.before') !!}

@inject('sectionRepository', 'Webkul\Theme\Repositories\SectionRepository')

@php
    $channel = core()->getCurrentChannel();

    $section = $sectionRepository->findOneOfType(
        \Webkul\Theme\Enums\SectionTypeEnum::FOOTER_LINKS->value,
        $channel->id,
        $channel->theme,
        app()->getLocale()
    );

    $columns = collect($section?->getTypeInstance()?->sanitize((array) $section->options) ?? [])
        ->map(fn ($links) => array_filter((array) $links, fn ($link) => filled($link['title'] ?? null)))
        ->filter();

    $col1Links = $columns->get('column_1') ?? [
        ['title' => 'Về chúng tôi', 'url' => url('/page/about-us')],
        ['title' => 'Chăm sóc khách hàng', 'url' => url('/page/customer-service')],
        ['title' => 'Sản phẩm mới & Xu hướng', 'url' => url('/page/whats-new')],
        ['title' => 'Điều khoản sử dụng', 'url' => url('/page/terms-of-use')],
        ['title' => 'Điều kiện giao dịch', 'url' => url('/page/terms-conditions')],
    ];

    $col2Links = $columns->get('column_2') ?? [
        ['title' => 'Chính sách bảo mật', 'url' => url('/page/privacy-policy')],
        ['title' => 'Chính sách thanh toán', 'url' => url('/page/payment-policy')],
        ['title' => 'Chính sách vận chuyển', 'url' => url('/page/shipping-policy')],
        ['title' => 'Chính sách đổi trả 1-1', 'url' => url('/page/return-policy')],
        ['title' => 'Chính sách hoàn tiền', 'url' => url('/page/refund-policy')],
    ];
@endphp

<footer
    class="mt-16 w-full border-t border-[#e2e8f0] bg-white text-[#475569]"
    @if ($section && $sectionRepository->isPreviewing())
        data-section-id="{{ $section->id }}"
        data-section-name="{{ $section->name }}"
    @endif
>
    <!-- Container Footer Lớn & Rộng Rãi Đồng Bộ Toàn Trang (Max-Width 1440px) -->
    <div style="max-width: 1440px; margin: 0 auto; padding: 60px 48px 48px; box-sizing: border-box;">
        <div style="display: grid; grid-template-columns: 1.3fr 1fr 1fr 1.2fr; gap: 48px; align-items: start;">
            
            <!-- Cột 1: Thông tin Showroom ShopSiuu -->
            <div style="display: flex; flex-direction: column; gap: 14px;">
                <h3 style="font-size: 21px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.03em; color: #0f172a; margin: 0 0 8px 0;">
                    ShopSiuu Gaming Gear
                </h3>
                <p style="font-size: 16px; line-height: 1.7; color: #64748b; margin: 0 0 6px 0;">
                    Hệ sinh thái phân phối thiết bị ngoại vi, phụ kiện bàn phím cơ và chuột gaming hi-end chính hãng hàng đầu.
                </p>
                <div style="display: flex; flex-direction: column; gap: 8px; font-size: 16px; color: #64748b;">
                    <p style="margin: 0;"><strong style="color: #1e293b;">Địa chỉ:</strong> 127e Lê, P. Tân Phú, TP. HCM</p>
                    <p style="margin: 0;"><strong style="color: #1e293b;">Hotline:</strong> 0909 xxx xxx (08:30 - 21:30)</p>
                    <p style="margin: 0;"><strong style="color: #1e293b;">Email:</strong> hotro@shopsiuu.vn</p>
                </div>
            </div>

            <!-- Cột 2: Hỗ trợ khách hàng (Font Tiêu đề 21px, Chữ thường 16px) -->
            <div style="display: flex; flex-direction: column; gap: 14px;" v-pre>
                <h3 style="font-size: 21px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.03em; color: #0f172a; margin: 0 0 8px 0;">
                    Hỗ Trợ Khách Hàng
                </h3>
                <ul style="list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 12px; font-size: 16px;">
                    @foreach ($col1Links as $link)
                        <li>
                            <a
                                href="{{ $link['url'] }}"
                                style="color: #64748b; text-decoration: none; font-size: 16px; transition: color 0.2s;"
                                onmouseover="this.style.color='#2563eb'"
                                onmouseout="this.style.color='#64748b'"
                            >
                                {{ $link['title'] }}
                            </a>
                        </li>
                    @endforeach
                </ul>
            </div>

            <!-- Cột 3: Chính sách chung (Font Tiêu đề 21px, Chữ thường 16px) -->
            <div style="display: flex; flex-direction: column; gap: 14px;" v-pre>
                <h3 style="font-size: 21px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.03em; color: #0f172a; margin: 0 0 8px 0;">
                    Chính Sách Chung
                </h3>
                <ul style="list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 12px; font-size: 16px;">
                    @foreach ($col2Links as $link)
                        <li>
                            <a
                                href="{{ $link['url'] }}"
                                style="color: #64748b; text-decoration: none; font-size: 16px; transition: color 0.2s;"
                                onmouseover="this.style.color='#2563eb'"
                                onmouseout="this.style.color='#64748b'"
                            >
                                {{ $link['title'] }}
                            </a>
                        </li>
                    @endforeach
                </ul>
            </div>

            <!-- Cột 4: Đăng Ký Nhận Tin (Font Tiêu đề 21px, Chữ thường 16px) -->
            <div style="display: flex; flex-direction: column; gap: 14px;">
                <h3 style="font-size: 21px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.03em; color: #0f172a; margin: 0 0 8px 0;">
                    Đăng Ký Nhận Tin
                </h3>
                <p style="font-size: 16px; line-height: 1.7; color: #64748b; margin: 0 0 6px 0;">
                    Nhận voucher giảm giá 10% cho đơn hàng gaming gear đầu tiên của bạn.
                </p>

                {!! view_render_event('bagisto.shop.layout.footer.newsletter_subscription.before') !!}

                <form
                    action="{{ route('shop.subscription.store') }}"
                    method="POST"
                    style="display: flex; align-items: stretch; width: 100%; margin: 8px 0 10px 0;"
                >
                    @csrf
                    <input
                        type="email"
                        name="email"
                        required
                        placeholder="Nhập email của bạn..."
                        style="flex: 1; min-width: 0; height: 48px; padding: 0 16px; border: 1.5px solid #cbd5e1; border-right: none; border-radius: 8px 0 0 8px; font-size: 16px; color: #0f172a; outline: none; background: #ffffff; box-sizing: border-box;"
                    />
                    <button
                        type="submit"
                        style="height: 48px; padding: 0 24px; background-color: #2563eb; color: #ffffff; border: 1.5px solid #2563eb; border-radius: 0 8px 8px 0; font-size: 16px; font-weight: 600; cursor: pointer; white-space: nowrap; box-sizing: border-box; transition: background-color 0.2s;"
                        onmouseover="this.style.backgroundColor='#1d4ed8'; this.style.borderColor='#1d4ed8';"
                        onmouseout="this.style.backgroundColor='#2563eb'; this.style.borderColor='#2563eb';"
                    >
                        Gửi
                    </button>
                </form>

                {!! view_render_event('bagisto.shop.layout.footer.newsletter_subscription.after') !!}

                <div style="font-size: 16px; font-weight: 600; color: #16a34a; margin-top: 4px;">
                    ✓ Cam kết hàng chính hãng 100%
                </div>
            </div>

        </div>
    </div>

    <!-- Dòng Copyright chân trang (Font 16px căn giữa) -->
    <div style="border-top: 1px solid #e2e8f0; background-color: #f8fafc; padding: 22px 24px; text-align: center; font-size: 16px; color: #64748b;">
        {!! view_render_event('bagisto.shop.layout.footer.footer_text.before') !!}

        <p style="margin: 0; font-size: 16px;">
            @if (core()->getConfigData('general.content.footer.copyright_content'))
                {!! clean_content((string) core()->getConfigData('general.content.footer.copyright_content')) !!}
            @else
                © {{ date('Y') }} ShopSiuu Store – Hệ thống Thương mại Điện tử Đồ án Tốt nghiệp. All rights reserved.
            @endif
        </p>

        {!! view_render_event('bagisto.shop.layout.footer.footer_text.after') !!}
    </div>
</footer>

{!! view_render_event('bagisto.shop.layout.footer.after') !!}
