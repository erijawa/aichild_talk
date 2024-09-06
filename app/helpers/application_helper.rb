module ApplicationHelper
  def default_meta_tags
    {
      site: 'ちびっこトーク',
      title: 'ちびっこトーク',
      reverse: true,
      charset: 'utf-8',
      description: '3歳児の「なんで？」に答えましょう。あなたはどこまで説明できますか？',
      keywords: '学習,自己分析,AI',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url("favicon.ico"), sizes: "60x60" },
        { href: image_url("OGP.png"), rel: "apple-touch-icon", sizes: "90x90", type: "image/png" },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('OGP.png'),
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@riviere_rouge',
        image: image_url('OGP.png')
      }
    }
  end
end
