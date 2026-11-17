.class public final Lcom/melodix/music/GlassScreenStyler;
.super Ljava/lang/Object;
.source "GlassScreenStyler.java"


# static fields
.field private static final LILAC:I = -0x324901

.field private static final MUTED:I = -0x424b36

.field private static final WHITE:I = -0x70a01

.field private static final artwork:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Landroid/app/Activity;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/melodix/music/GlassScreenStyler;->artwork:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static dp(Landroid/content/Context;F)I
    .locals 1

    .prologue
    .line 27
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method private static glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;
    .locals 4

    .prologue
    .line 29
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TL_BR:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const/4 v2, 0x2

    new-array v2, v2, [I

    const/4 v3, 0x0

    aput p1, v2, v3

    const/4 v3, 0x1

    aput p2, v2, v3

    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 30
    int-to-float v1, p3

    invoke-static {p0, v1}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    if-eqz p4, :cond_0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {p0, v1}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-virtual {v0, v1, p4}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    :cond_0
    return-object v0
.end method

.method private static glyph(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 111
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 112
    const-string v1, "compte"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "profil"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const-string v0, "\u25c9"

    .line 118
    :goto_0
    return-object v0

    .line 113
    :cond_1
    const-string v1, "qualit\u00e9"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "volume"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_2
    const-string v0, "\u266b"

    goto :goto_0

    .line 114
    :cond_3
    const-string v1, "lecture"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "shuffle"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "al\u00e9atoire"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "r\u00e9p\u00e9t"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_5

    :cond_4
    const-string v0, "\u25b6"

    goto :goto_0

    .line 115
    :cond_5
    const-string v1, "cache"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "stockage"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "biblioth\u00e8que"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_7

    :cond_6
    const-string v0, "\u25a6"

    goto :goto_0

    .line 116
    :cond_7
    const-string v1, "d\u00e9connexion"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_8

    const-string v0, "\u2197"

    goto :goto_0

    .line 117
    :cond_8
    const-string v1, "melodix"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "M"

    goto :goto_0

    .line 118
    :cond_9
    const-string v0, "\u2726"

    goto :goto_0
.end method

.method static liked(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 41
    if-eqz p0, :cond_1

    const-string v0, "spotify:collection:tracks"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 42
    const-string v0, "(?i)^https://open\\.spotify\\.com/(?:intl-[a-z]{2}(?:-[a-z]{2})?/)?collection/tracks/?(?:\\?[^#]*)?(?:#.*)?$"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 41
    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static playlist(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V
    .locals 11

    .prologue
    .line 79
    invoke-static {p1}, Lcom/melodix/music/GlassScreenStyler;->rowContainer(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v1

    .line 80
    const-string v0, "glass-old-playlist-heading"

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 81
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-ne v2, v1, :cond_0

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 82
    :cond_0
    invoke-static {p2}, Lcom/melodix/music/GlassScreenStyler;->liked(Ljava/lang/String;)Z

    move-result v2

    .line 83
    invoke-static {p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v3

    if-eqz v2, :cond_1

    const-string v0, "liked-hero"

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    :cond_1
    const/high16 v0, 0x41400000    # 12.0f

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v0

    const/high16 v4, 0x41400000    # 12.0f

    invoke-static {p0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v4

    const/high16 v5, 0x41400000    # 12.0f

    invoke-static {p0, v5}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    const/high16 v6, 0x41600000    # 14.0f

    invoke-static {p0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    invoke-virtual {v3, v0, v4, v5, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 84
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v0, 0x11

    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 85
    new-instance v5, Landroid/widget/ImageView;

    invoke-direct {v5, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v5, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 86
    const v0, -0x91c363

    const v6, -0xdbe6c3

    const/16 v7, 0xe

    const v8, 0x45ffffff    # 8191.9995f

    invoke-static {p0, v0, v6, v7, v8}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {v5, v0}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 87
    const/4 v0, 0x1

    invoke-virtual {v5, v0}, Landroid/widget/ImageView;->setClipToOutline(Z)V

    const/4 v0, 0x2

    invoke-virtual {v5, v0}, Landroid/widget/ImageView;->setImportantForAccessibility(I)V

    .line 88
    invoke-static {p0, p2}, Lcom/melodix/music/GlassScreenStyler;->selectedArtwork(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 89
    invoke-static {p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v7

    const/16 v0, 0x11

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 90
    if-eqz v2, :cond_4

    const v0, -0x89aa18

    const v8, -0xc9cf5d

    const/16 v9, 0xe

    const v10, 0x4affffff    # 8388607.5f

    invoke-static {p0, v0, v8, v9, v10}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    :goto_0
    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 91
    if-eqz v6, :cond_5

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    .line 92
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x1

    const/4 v9, -0x1

    invoke-direct {v0, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 93
    const/high16 v0, 0x43480000    # 200.0f

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v0

    invoke-static {v5, v6, v0}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V

    .line 100
    :goto_1
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x43240000    # 164.0f

    invoke-static {p0, v5}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    const/high16 v6, 0x43240000    # 164.0f

    invoke-static {p0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    invoke-direct {v0, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v7, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 101
    if-eqz v2, :cond_8

    const-string v0, "VOTRE BIBLIOTH\u00c8QUE"

    :goto_2
    const/16 v4, 0xa

    const v5, -0x324901

    const/4 v6, 0x1

    invoke-static {p0, v0, v4, v5, v6}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v0

    const v4, 0x3e23d70a    # 0.16f

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setLetterSpacing(F)V

    .line 102
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v5, 0x41900000    # 18.0f

    invoke-static {p0, v5}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v3, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 103
    if-eqz p3, :cond_2

    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    if-eqz v2, :cond_9

    const-string p3, "Titres lik\u00e9s"

    :cond_3
    :goto_3
    const/16 v0, 0x1a

    const v2, -0x70a01

    const/4 v4, 0x1

    invoke-static {p0, p3, v0, v2, v4}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v0

    .line 104
    const/4 v2, 0x3

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 105
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v2, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v4, 0x40800000    # 4.0f

    invoke-static {p0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v4

    iput v4, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v3, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 106
    const-string v0, "Titres"

    const/16 v2, 0xe

    const v4, -0x70a01

    const/4 v5, 0x1

    invoke-static {p0, v0, v2, v4, v5}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v0

    const v2, 0x3ca3d70a    # 0.02f

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setLetterSpacing(F)V

    .line 107
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v2, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v4, 0x41a00000    # 20.0f

    invoke-static {p0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v4

    iput v4, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v3, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 108
    const/4 v0, 0x0

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v2, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 109
    return-void

    .line 90
    :cond_4
    const v0, -0x89b059

    const v8, -0xd8dfc8

    const/16 v9, 0xe

    const v10, 0x4affffff    # 8388607.5f

    invoke-static {p0, v0, v8, v9, v10}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    goto/16 :goto_0

    .line 95
    :cond_5
    if-eqz v2, :cond_6

    const-string v0, "\u2665"

    :goto_4
    const/16 v5, 0x3a

    const v6, -0x192901

    const/4 v8, 0x1

    invoke-static {p0, v0, v5, v6, v8}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v0

    const/16 v5, 0x11

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 96
    const/4 v5, 0x2

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 97
    if-eqz v2, :cond_7

    const-string v0, "TITRES LIK\u00c9S"

    :goto_5
    const/16 v5, 0xa

    const v6, -0x19230f

    const/4 v8, 0x1

    invoke-static {p0, v0, v5, v6, v8}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v0

    const v5, 0x3e23d70a    # 0.16f

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setLetterSpacing(F)V

    const/16 v5, 0x11

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 98
    const/4 v5, 0x2

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_1

    .line 95
    :cond_6
    const-string v0, "\u266b"

    goto :goto_4

    .line 97
    :cond_7
    const-string v0, "PLAYLIST"

    goto :goto_5

    .line 101
    :cond_8
    const-string v0, "PLAYLIST"

    goto/16 :goto_2

    .line 103
    :cond_9
    const-string p3, "Playlist"

    goto/16 :goto_3
.end method

.method private static playlist(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 38
    if-eqz p0, :cond_1

    const-string v0, ":playlist:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "/playlist/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static rememberSelection(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .prologue
    .line 47
    if-eqz p0, :cond_0

    invoke-static {p1}, Lcom/melodix/music/GlassScreenStyler;->playlist(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 61
    :cond_0
    :goto_0
    return-void

    .line 48
    :cond_1
    const-string v0, ""

    .line 50
    :try_start_0
    new-instance v2, Lorg/json/JSONArray;

    if-nez p2, :cond_2

    const-string p2, "[]"

    :cond_2
    invoke-direct {v2, p2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 51
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-lt v1, v3, :cond_5

    move-object v1, v0

    .line 57
    :goto_2
    sget-object v0, Lcom/melodix/music/GlassScreenStyler;->artwork:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 58
    if-nez v0, :cond_3

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sget-object v2, Lcom/melodix/music/GlassScreenStyler;->artwork:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    :cond_3
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v2

    const/16 v3, 0x20

    if-lt v2, v3, :cond_4

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    :cond_4
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 52
    :cond_5
    :try_start_1
    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    if-nez v3, :cond_7

    .line 51
    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 53
    :cond_7
    const-string v4, "uri"

    const-string v5, "id"

    const-string v6, ""

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 54
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    const-string v1, "image"

    const-string v2, "cover"

    const-string v4, "artwork"

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    move-object v1, v0

    goto :goto_2

    :catch_0
    move-exception v1

    move-object v1, v0

    goto :goto_2
.end method

.method private static rowContainer(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 71
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    .line 72
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 76
    :goto_0
    return-object v0

    .line 74
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 75
    :goto_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-gtz v1, :cond_1

    .line 76
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    .line 75
    :cond_1
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->removeViewAt(I)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_1
.end method

.method private static selectedArtwork(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 62
    sget-object v0, Lcom/melodix/music/GlassScreenStyler;->artwork:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string v0, ""

    goto :goto_0
.end method

.method private static settings(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .locals 12

    .prologue
    const/4 v11, 0x1

    const/4 v2, 0x0

    const/4 v10, -0x1

    const/4 v9, -0x2

    const/high16 v8, 0x41900000    # 18.0f

    .line 121
    invoke-static {p1}, Lcom/melodix/music/GlassScreenStyler;->rowContainer(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v3

    move v1, v2

    .line 122
    :goto_0
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-lt v1, v0, :cond_0

    .line 129
    invoke-static {p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 130
    invoke-static {p0, v8}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-static {p0, v8}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v4

    invoke-static {p0, v8}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-static {p0, v8}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    invoke-virtual {v0, v1, v4, v5, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 131
    const v1, -0x17a4c980

    const v4, -0x29dee5d0

    const/16 v5, 0x16

    const v6, 0x50ffffff

    invoke-static {p0, v1, v4, v5, v6}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 132
    const-string v1, "MELODIX  \u2022  VOTRE ESPACE"

    const/16 v4, 0xa

    const v5, -0x1a2a01

    invoke-static {p0, v1, v4, v5, v11}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v1

    const v4, 0x3df5c28f    # 0.12f

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setLetterSpacing(F)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 133
    const-string v1, "Votre musique,\n\u00e0 votre fa\u00e7on."

    const/16 v4, 0x16

    const v5, -0x70a01

    invoke-static {p0, v1, v4, v5, v11}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v1

    .line 134
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v10, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v5, 0x40e00000    # 7.0f

    invoke-static {p0, v5}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v0, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 135
    const-string v1, "Personnalisez votre exp\u00e9rience."

    const/16 v4, 0xc

    const v5, -0x26331b

    invoke-static {p0, v1, v4, v5, v2}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v1

    .line 136
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v10, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v5, 0x40c00000    # 6.0f

    invoke-static {p0, v5}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v0, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 137
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v10, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v4, 0x40c00000    # 6.0f

    invoke-static {p0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v4

    iput v4, v1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 138
    invoke-virtual {v3, v0, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 139
    return-void

    .line 123
    :cond_0
    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 124
    instance-of v4, v0, Landroid/widget/TextView;

    if-eqz v4, :cond_2

    .line 125
    check-cast v0, Landroid/widget/TextView;

    const/high16 v4, 0x41600000    # 14.0f

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextSize(F)V

    const v4, -0x324901

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    sget-object v4, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v4, v11}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 126
    const/high16 v4, 0x40800000    # 4.0f

    invoke-static {p0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v4

    const/high16 v5, 0x41b00000    # 22.0f

    invoke-static {p0, v5}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    const/high16 v6, 0x40800000    # 4.0f

    invoke-static {p0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    const/high16 v7, 0x41200000    # 10.0f

    invoke-static {p0, v7}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-virtual {v0, v4, v5, v6, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 122
    :cond_1
    :goto_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto/16 :goto_0

    .line 127
    :cond_2
    instance-of v4, v0, Landroid/widget/LinearLayout;

    if-eqz v4, :cond_1

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->styleSettingRow(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    goto :goto_1
.end method

.method public static style(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 64
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 69
    :cond_0
    :goto_0
    return-void

    .line 65
    :cond_1
    const-string v0, "settings"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {p0, p1}, Lcom/melodix/music/GlassScreenStyler;->settings(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    .line 68
    :cond_2
    :goto_1
    invoke-static {p0, p1, p2, p3}, Lcom/melodix/music/GlassLikedMotion;->bind(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 66
    :cond_3
    const-string v0, "detail"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {p3}, Lcom/melodix/music/GlassScreenStyler;->playlist(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {p0, p1, p3, p4}, Lcom/melodix/music/GlassScreenStyler;->playlist(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 67
    :cond_4
    const-string v0, "detail"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p3}, Lcom/melodix/music/GlassScreenStyler;->liked(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p0, p1, p3, p4}, Lcom/melodix/music/GlassScreenStyler;->playlist(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method private static styleSettingRow(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .locals 12

    .prologue
    const/4 v8, 0x0

    const/4 v11, 0x2

    const/4 v2, 0x1

    const/high16 v10, 0x41400000    # 12.0f

    const/4 v7, 0x0

    .line 141
    move v6, v7

    move v3, v7

    move-object v4, v8

    move-object v5, v8

    .line 142
    :goto_0
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-lt v6, v0, :cond_1

    .line 148
    if-eqz v5, :cond_0

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/TextView;

    if-nez v0, :cond_4

    .line 173
    :cond_0
    :goto_1
    return-void

    .line 143
    :cond_1
    invoke-virtual {p1, v6}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 144
    instance-of v1, v0, Landroid/widget/ImageView;

    if-eqz v1, :cond_2

    move v1, v2

    .line 142
    :goto_2
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    move v3, v1

    goto :goto_0

    .line 145
    :cond_2
    instance-of v1, v0, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_3

    check-cast v0, Landroid/widget/LinearLayout;

    move v1, v3

    move-object v5, v0

    goto :goto_2

    .line 146
    :cond_3
    instance-of v1, v0, Landroid/widget/TextView;

    if-eqz v1, :cond_f

    check-cast v0, Landroid/widget/TextView;

    move v1, v3

    move-object v4, v0

    goto :goto_2

    .line 149
    :cond_4
    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const/high16 v1, 0x41700000    # 15.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const v1, -0x70a01

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0, v11}, Landroid/widget/TextView;->setMaxLines(I)V

    move v6, v2

    .line 150
    :goto_3
    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lt v6, v1, :cond_7

    .line 153
    invoke-static {p0, v10}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v1

    const/high16 v5, 0x41500000    # 13.0f

    invoke-static {p0, v5}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-static {p0, v10}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    const/high16 v9, 0x41500000    # 13.0f

    invoke-static {p0, v9}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v9

    invoke-virtual {p1, v1, v5, v6, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/high16 v1, 0x42900000    # 72.0f

    invoke-static {p0, v1}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 154
    const v1, -0x37c7d3b7

    const v5, -0x2ae4e8da

    const/16 v6, 0x14

    const v9, 0x30ffffff

    invoke-static {p0, v1, v5, v6, v9}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    .line 155
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->isClickable()Z

    move-result v1

    if-eqz v1, :cond_9

    new-instance v1, Landroid/graphics/drawable/RippleDrawable;

    const v6, 0x55c9a8ff

    invoke-static {v6}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v6

    invoke-direct {v1, v6, v5, v8}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :goto_4
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 156
    if-nez v3, :cond_5

    .line 157
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/GlassScreenStyler;->glyph(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x13

    const v3, -0x1c2d01

    invoke-static {p0, v0, v1, v3, v2}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v0

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 158
    const v1, -0x557fa856

    const v2, -0x779cbc7e

    const/16 v3, 0xc

    const v5, 0x30ffffff

    invoke-static {p0, v1, v2, v3, v5}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 159
    invoke-virtual {v0, v11}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    .line 160
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x42200000    # 40.0f

    invoke-static {p0, v2}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v2

    const/high16 v3, 0x42200000    # 40.0f

    invoke-static {p0, v3}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p0, v10}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    invoke-virtual {p1, v0, v7, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 162
    :cond_5
    if-eqz v4, :cond_6

    .line 163
    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "ON"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    .line 164
    const-string v1, "Indisponible"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    .line 165
    if-eqz v2, :cond_a

    const v0, -0x57920e

    move v1, v0

    .line 166
    :goto_5
    if-eqz v2, :cond_c

    const v0, -0x28ae5b

    .line 167
    :goto_6
    const/16 v2, 0x10

    const v5, 0x22ffffff

    invoke-static {p0, v1, v0, v2, v5}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    if-eqz v3, :cond_e

    const v0, -0x3f4638

    :goto_7
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 168
    const/high16 v0, 0x41300000    # 11.0f

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setTextSize(F)V

    const/high16 v0, 0x41200000    # 10.0f

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v0

    const/high16 v1, 0x40e00000    # 7.0f

    invoke-static {p0, v1}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v1

    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {p0, v2}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v2

    const/high16 v3, 0x40e00000    # 7.0f

    invoke-static {p0, v3}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-virtual {v4, v0, v1, v2, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 169
    const/high16 v0, 0x42e00000    # 112.0f

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v0

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setMaxWidth(I)V

    invoke-virtual {v4, v11}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 171
    :cond_6
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 172
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {p0, v1}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_1

    .line 150
    :cond_7
    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v1, v1, Landroid/widget/TextView;

    if-eqz v1, :cond_8

    .line 151
    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, v10}, Landroid/widget/TextView;->setTextSize(F)V

    const v9, -0x424b36

    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v9, 0x3

    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 150
    :cond_8
    add-int/lit8 v1, v6, 0x1

    move v6, v1

    goto/16 :goto_3

    :cond_9
    move-object v1, v5

    .line 155
    goto/16 :goto_4

    .line 165
    :cond_a
    if-eqz v3, :cond_b

    const v0, 0x664a4253

    move v1, v0

    goto/16 :goto_5

    :cond_b
    const v0, -0x7792a284

    move v1, v0

    goto/16 :goto_5

    .line 166
    :cond_c
    if-eqz v3, :cond_d

    const v0, 0x66403a49

    goto/16 :goto_6

    :cond_d
    const v0, -0x779fb08e

    goto/16 :goto_6

    .line 167
    :cond_e
    const v0, -0x70a01

    goto/16 :goto_7

    :cond_f
    move v1, v3

    goto/16 :goto_2
.end method

.method private static text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;
    .locals 3

    .prologue
    .line 33
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    int-to-float v1, p2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    if-eqz p4, :cond_0

    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    :cond_0
    return-object v0
.end method

.method private static vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;
    .locals 2

    .prologue
    .line 36
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    return-object v0
.end method
