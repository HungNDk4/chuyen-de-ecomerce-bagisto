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
        ['title' => 'About Us', 'url' => url('/page/about-us')],
        ['title' => 'Customer Service', 'url' => url('/page/customer-service')],
        ['title' => 'New Arrivals & Trends', 'url' => url('/page/whats-new')],
        ['title' => 'Terms of Use', 'url' => url('/page/terms-of-use')],
        ['title' => 'Terms & Conditions', 'url' => url('/page/terms-conditions')],
    ];

    $col2Links = $columns->get('column_2') ?? [
        ['title' => 'Privacy Policy', 'url' => url('/page/privacy-policy')],
        ['title' => 'Payment Policy', 'url' => url('/page/payment-policy')],
        ['title' => 'Shipping Policy', 'url' => url('/page/shipping-policy')],
        ['title' => 'Return Policy', 'url' => url('/page/return-policy')],
        ['title' => 'Refund Policy', 'url' => url('/page/refund-policy')],
    ];
@endphp

<footer
    class="mt-16 w-full border-t border-[#e2e8f0] bg-white text-[#475569]"
    @if ($section && $sectionRepository->isPreviewing())
        data-section-id="{{ $section->id }}"
        data-section-name="{{ $section->name }}"
    @endif
>
    <!-- Container Footer (Max-Width 1440px) -->
    <div style="max-width: 1440px; margin: 0 auto; padding: 60px 48px 48px; box-sizing: border-box;">
        <div style="display: grid; grid-template-columns: 1.3fr 1fr 1fr 1.2fr; gap: 48px; align-items: start;">
            
            <!-- Column 1: Showroom Info -->
            <div style="display: flex; flex-direction: column; gap: 14px;">
                <h3 style="font-size: 21px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.03em; color: #0f172a; margin: 0 0 8px 0;">
                    ShopSiuu Gaming Gear
                </h3>
                <p style="font-size: 16px; line-height: 1.7; color: #64748b; margin: 0 0 6px 0;">
                    Authorized distributor of authentic gaming gear, mechanical keyboards, and precision peripherals.
                </p>
                <div style="display: flex; flex-direction: column; gap: 8px; font-size: 16px; color: #64748b;">
                    <p style="margin: 0;"><strong style="color: #1e293b;">Address:</strong> 127e Le Lu, Tan Phu District, Ho Chi Minh City</p>
                    <p style="margin: 0;"><strong style="color: #1e293b;">Hotline:</strong> 0909 xxx xxx (08:30 - 21:30)</p>
                    <p style="margin: 0;"><strong style="color: #1e293b;">Email:</strong> support@shopsiuu.com</p>
                </div>
            </div>

            <!-- Column 2: Customer Support -->
            <div style="display: flex; flex-direction: column; gap: 14px;" v-pre>
                <h3 style="font-size: 21px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.03em; color: #0f172a; margin: 0 0 8px 0;">
                    Customer Support
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

            <!-- Column 3: Store Policies -->
            <div style="display: flex; flex-direction: column; gap: 14px;" v-pre>
                <h3 style="font-size: 21px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.03em; color: #0f172a; margin: 0 0 8px 0;">
                    Store Policies
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

            <!-- Column 4: Newsletter -->
            <div style="display: flex; flex-direction: column; gap: 14px;">
                <h3 style="font-size: 21px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.03em; color: #0f172a; margin: 0 0 8px 0;">
                    Newsletter
                </h3>
                <p style="font-size: 16px; line-height: 1.7; color: #64748b; margin: 0 0 6px 0;">
                    Subscribe to receive a 10% discount voucher for your first order.
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
                        placeholder="Enter your email address..."
                        style="flex: 1; min-width: 0; height: 48px; padding: 0 16px; border: 1.5px solid #cbd5e1; border-right: none; border-radius: 8px 0 0 8px; font-size: 16px; color: #0f172a; outline: none; background: #ffffff; box-sizing: border-box;"
                    />
                    <button
                        type="submit"
                        style="height: 48px; padding: 0 24px; background-color: #2563eb; color: #ffffff; border: 1.5px solid #2563eb; border-radius: 0 8px 8px 0; font-size: 16px; font-weight: 600; cursor: pointer; white-space: nowrap; box-sizing: border-box; transition: background-color 0.2s;"
                        onmouseover="this.style.backgroundColor='#1d4ed8'; this.style.borderColor='#1d4ed8';"
                        onmouseout="this.style.backgroundColor='#2563eb'; this.style.borderColor='#2563eb';"
                    >
                        Subscribe
                    </button>
                </form>

                {!! view_render_event('bagisto.shop.layout.footer.newsletter_subscription.after') !!}

                <div style="font-size: 16px; font-weight: 600; color: #16a34a; margin-top: 4px;">
                    ✓ 100% Genuine Guarantee
                </div>
            </div>

        </div>
    </div>

    <!-- Copyright Bar -->
    <div style="border-top: 1px solid #e2e8f0; background-color: #f8fafc; padding: 22px 24px; text-align: center; font-size: 16px; color: #64748b;">
        {!! view_render_event('bagisto.shop.layout.footer.footer_text.before') !!}

        <p style="margin: 0; font-size: 16px;">
            @if (core()->getConfigData('general.content.footer.copyright_content'))
                {!! clean_content((string) core()->getConfigData('general.content.footer.copyright_content')) !!}
            @else
                © {{ date('Y') }} ShopSiuu Store – Graduation Capstone Project E-Commerce Platform. All rights reserved.
            @endif
        </p>

        {!! view_render_event('bagisto.shop.layout.footer.footer_text.after') !!}
    </div>
</footer>

{!! view_render_event('bagisto.shop.layout.footer.after') !!}
