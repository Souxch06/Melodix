.class public final Lcom/melodix/music/GlassScreenStyler;
.super Ljava/lang/Object;
.source "GlassScreenStyler.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final LILAC:I = -0x324901

.field private static final MUTED:I = -0x424b36

.field private static final WHITE:I = -0x70a01

.field private static final artwork:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private final waitHero:Landroid/widget/LinearLayout;

.field private final waitImage:Landroid/widget/ImageView;

.field private final waitTries:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/melodix/music/GlassScreenStyler;->artwork:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>(Landroid/widget/LinearLayout;Landroid/widget/ImageView;I)V
    .locals 0

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/melodix/music/GlassScreenStyler;->waitHero:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lcom/melodix/music/GlassScreenStyler;->waitImage:Landroid/widget/ImageView;

    iput p3, p0, Lcom/melodix/music/GlassScreenStyler;->waitTries:I

    return-void
.end method

.method private static dp(Landroid/content/Context;F)I
    .locals 0

    .line 28
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method private static glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 30
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TL_BR:Landroid/graphics/drawable/GradientDrawable$Orientation;

    filled-new-array {p1, p2}, [I

    move-result-object p1

    invoke-direct {v0, v1, p1}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 31
    int-to-float p1, p3

    invoke-static {p0, p1}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    if-eqz p4, :cond_0

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-static {p0, p1}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result p0

    invoke-virtual {v0, p0, p4}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    :cond_0
    return-object v0
.end method

.method private static glow(Landroid/content/Context;I)Landroid/graphics/drawable/GradientDrawable;
    .locals 4

    .line 134
    const v0, 0xffffff

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    and-int/2addr v0, p1

    .line 135
    :goto_0
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    if-nez p1, :cond_1

    const/16 v3, 0x12

    goto :goto_1

    :cond_1
    const/16 v3, 0x66

    :goto_1
    shl-int/lit8 v3, v3, 0x18

    or-int/2addr v3, v0

    if-nez p1, :cond_2

    const/4 p1, 0x5

    goto :goto_2

    :cond_2
    const/16 p1, 0x1f

    :goto_2
    shl-int/lit8 p1, p1, 0x18

    or-int/2addr p1, v0

    const/4 v0, 0x0

    filled-new-array {v3, p1, v0}, [I

    move-result-object p1

    invoke-direct {v1, v2, p1}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 136
    const/high16 p1, 0x41a00000    # 20.0f

    invoke-static {p0, p1}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {v1, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v1
.end method

.method private static glyph(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 154
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 155
    const-string v0, "compte"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_9

    const-string v0, "profil"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_3

    .line 156
    :cond_0
    const-string v0, "qualit\u00e9"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_8

    const-string v0, "volume"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_8

    const-string v0, "audio"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_2

    .line 157
    :cond_1
    const-string v0, "lecture"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7

    const-string v0, "shuffle"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7

    const-string v0, "al\u00e9atoire"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7

    const-string v0, "r\u00e9p\u00e9t"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    .line 158
    :cond_2
    const-string v0, "cache"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "stockage"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "biblioth\u00e8que"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_0

    .line 159
    :cond_3
    const-string v0, "d\u00e9connexion"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string p0, "\u2197"

    return-object p0

    .line 160
    :cond_4
    const-string v0, "melodix"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_5

    const-string p0, "M"

    return-object p0

    .line 161
    :cond_5
    const-string p0, "\u2726"

    return-object p0

    .line 158
    :cond_6
    :goto_0
    const-string p0, "\u25a6"

    return-object p0

    .line 157
    :cond_7
    :goto_1
    const-string p0, "\u25b6"

    return-object p0

    .line 156
    :cond_8
    :goto_2
    const-string p0, "\u266b"

    return-object p0

    .line 155
    :cond_9
    :goto_3
    const-string p0, "\u25c9"

    return-object p0
.end method

.method static liked(Ljava/lang/String;)Z
    .locals 1

    .line 42
    if-eqz p0, :cond_1

    const-string v0, "spotify:collection:tracks"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 43
    const-string v0, "(?i)^https://open\\.spotify\\.com/(?:intl-[a-z]{2}(?:-[a-z]{2})?/)?collection/tracks/?(?:\\?[^#]*)?(?:#.*)?$"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    :cond_0
    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    .line 42
    :goto_0
    return p0
.end method

.method private static playlist(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V
    .locals 17

    .line 80
    move-object/from16 v0, p0

    invoke-static/range {p1 .. p1}, Lcom/melodix/music/GlassScreenStyler;->rowContainer(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v1

    .line 81
    const-string v2, "glass-old-playlist-heading"

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    .line 82
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-ne v3, v1, :cond_0

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 83
    :cond_0
    invoke-static/range {p2 .. p2}, Lcom/melodix/music/GlassScreenStyler;->liked(Ljava/lang/String;)Z

    move-result v2

    .line 84
    invoke-static/range {p0 .. p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v3

    const-string v4, "glass-playlist-hero"

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const/high16 v4, 0x41600000    # 14.0f

    invoke-static {v0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    const/high16 v6, 0x41800000    # 16.0f

    invoke-static {v0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-static {v0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v4

    const/high16 v8, 0x41900000    # 18.0f

    invoke-static {v0, v8}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v8

    invoke-virtual {v3, v5, v7, v4, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 86
    const/4 v4, 0x0

    invoke-static {v0, v4}, Lcom/melodix/music/GlassScreenStyler;->glow(Landroid/content/Context;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 88
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v7, 0x11

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 89
    new-instance v8, Landroid/widget/ImageView;

    invoke-direct {v8, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v9, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 90
    const v9, 0x1fffffff

    const v10, 0xfffffff

    const/16 v11, 0xa

    invoke-static {v0, v9, v10, v11, v4}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v12

    invoke-virtual {v8, v12}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 91
    const/4 v12, 0x1

    invoke-virtual {v8, v12}, Landroid/widget/ImageView;->setClipToOutline(Z)V

    const/4 v13, 0x2

    invoke-virtual {v8, v13}, Landroid/widget/ImageView;->setImportantForAccessibility(I)V

    .line 92
    move-object/from16 v14, p2

    invoke-static {v0, v14}, Lcom/melodix/music/GlassScreenStyler;->selectedArtwork(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 93
    invoke-static/range {p0 .. p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v15

    invoke-virtual {v15, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 94
    if-eqz v2, :cond_1

    const v10, -0xd5d5d2

    const v6, -0xeeeeed

    invoke-static {v0, v10, v6, v11, v9}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    goto :goto_0

    :cond_1
    invoke-static {v0, v9, v10, v11, v9}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    :goto_0
    invoke-virtual {v15, v6}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v15, v12}, Landroid/widget/LinearLayout;->setClipToOutline(Z)V

    const/high16 v6, 0x41200000    # 10.0f

    invoke-static {v0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v15, v6}, Landroid/widget/LinearLayout;->setElevation(F)V

    .line 95
    const-string v6, "PLAYLIST"

    const v10, -0x66000001

    const/4 v9, -0x1

    if-eqz v14, :cond_2

    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v16

    if-nez v16, :cond_2

    .line 96
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v9, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v15, v8, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 97
    const/high16 v7, 0x43700000    # 240.0f

    invoke-static {v0, v7}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-static {v8, v14, v7}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V

    invoke-static {v3, v8, v4}, Lcom/melodix/music/GlassScreenStyler;->tint(Landroid/widget/LinearLayout;Landroid/widget/ImageView;I)V

    goto :goto_3

    .line 101
    :cond_2
    if-eqz v2, :cond_3

    const-string v8, "\u2665\ufe0e"

    goto :goto_1

    :cond_3
    const-string v8, "\u266b"

    :goto_1
    if-eqz v2, :cond_4

    const/16 v14, 0x48

    goto :goto_2

    :cond_4
    const/16 v14, 0x3a

    :goto_2
    xor-int/lit8 v9, v2, 0x1

    const v4, -0x70a01

    invoke-static {v0, v8, v14, v4, v9}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 102
    invoke-virtual {v4, v13}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    invoke-virtual {v15, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 103
    if-nez v2, :cond_5

    .line 104
    invoke-static {v0, v6, v11, v10, v12}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v4

    const v8, 0x3e23d70a    # 0.16f

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setLetterSpacing(F)V

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 105
    invoke-virtual {v4, v13}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    invoke-virtual {v15, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 108
    :cond_5
    :goto_3
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x430c0000    # 140.0f

    invoke-static {v0, v7}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v8

    invoke-static {v0, v7}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-direct {v4, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v15, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 109
    invoke-static/range {p0 .. p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v4

    const/high16 v7, 0x41800000    # 16.0f

    invoke-static {v0, v7}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    const/4 v8, 0x0

    invoke-virtual {v4, v7, v8, v8, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x2

    const/4 v9, -0x1

    invoke-direct {v7, v9, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v4, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 110
    if-eqz v2, :cond_6

    const-string v6, "VOTRE BIBLIOTH\u00c8QUE"

    :cond_6
    const/16 v5, 0xb

    const/4 v7, 0x0

    invoke-static {v0, v6, v5, v10, v7}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v5

    const-string v6, "sans-serif-medium"

    invoke-static {v6, v7}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v9

    invoke-virtual {v5, v9, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    const v7, 0x3df5c28f    # 0.12f

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setLetterSpacing(F)V

    .line 111
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x1

    invoke-direct {v7, v9, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    if-eqz p3, :cond_8

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_7

    goto :goto_4

    :cond_7
    move-object/from16 v2, p3

    goto :goto_5

    :cond_8
    :goto_4
    if-eqz v2, :cond_9

    const-string v2, "Titres lik\u00e9s"

    goto :goto_5

    :cond_9
    const-string v2, "Playlist"

    :goto_5
    const/16 v5, 0x1a

    const v7, -0x50506

    const/4 v9, 0x0

    invoke-static {v0, v2, v5, v7, v9}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    .line 113
    invoke-static {v6, v9}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v2, v5, v9}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    const v5, -0x43dc28f6    # -0.01f

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setLetterSpacing(F)V

    const/4 v5, 0x0

    const v6, 0x3f866666    # 1.05f

    invoke-virtual {v2, v5, v6}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 114
    const/4 v5, 0x3

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 115
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    invoke-direct {v5, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x40c00000    # 6.0f

    invoke-static {v0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v4, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 117
    const/4 v2, 0x0

    const/4 v5, 0x0

    :goto_6
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v6

    if-ge v2, v6, :cond_b

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    if-eq v6, v3, :cond_a

    invoke-virtual {v6}, Landroid/view/View;->isClickable()Z

    move-result v6

    if-eqz v6, :cond_a

    add-int/lit8 v5, v5, 0x1

    :cond_a
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 118
    :cond_b
    if-lez v5, :cond_d

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    if-le v5, v12, :cond_c

    const-string v5, " titres"

    goto :goto_7

    :cond_c
    const-string v5, " titre"

    :goto_7
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/16 v5, 0xd

    const/4 v6, 0x0

    invoke-static {v0, v2, v5, v10, v6}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    const-string v5, "glass-playlist-count"

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 119
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    invoke-direct {v5, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x41000000    # 8.0f

    invoke-static {v0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v4, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 121
    :cond_d
    new-instance v2, Landroid/view/View;

    invoke-direct {v2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v4, 0x14ffffff

    invoke-virtual {v2, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 122
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x3f000000    # 0.5f

    invoke-static {v0, v5}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-static {v12, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    const/4 v6, -0x1

    invoke-direct {v4, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v5, 0x41a00000    # 20.0f

    invoke-static {v0, v5}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v3, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 123
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 125
    nop

    :goto_8
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-ge v12, v2, :cond_f

    invoke-virtual {v1, v12}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->isClickable()Z

    move-result v3

    if-nez v3, :cond_e

    const/4 v3, -0x1

    const/4 v4, 0x0

    const v7, 0x1fffffff

    goto :goto_9

    .line 126
    :cond_e
    const/4 v3, -0x1

    const/4 v4, 0x0

    invoke-static {v0, v3, v3, v11, v4}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    .line 127
    new-instance v6, Landroid/graphics/drawable/RippleDrawable;

    const v7, 0x1fffffff

    invoke-static {v7}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {v6, v8, v9, v5}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v2, v6}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 125
    :goto_9
    add-int/lit8 v12, v12, 0x1

    goto :goto_8

    .line 128
    :cond_f
    return-void
.end method

.method static playlist(Ljava/lang/String;)Z
    .locals 1

    .line 39
    if-eqz p0, :cond_1

    const-string v0, ":playlist:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "/playlist/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_1

    :cond_0
    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static rememberSelection(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    .line 48
    const-string v0, ""

    if-eqz p0, :cond_7

    invoke-static {p1}, Lcom/melodix/music/GlassScreenStyler;->playlist(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_3

    .line 49
    :cond_0
    nop

    .line 51
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    if-nez p2, :cond_1

    const-string p2, "[]"

    :cond_1
    invoke-direct {v1, p2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 52
    const/4 p2, 0x0

    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge p2, v2, :cond_4

    .line 53
    invoke-virtual {v1, p2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    if-nez v2, :cond_2

    goto :goto_1

    .line 54
    :cond_2
    const-string v3, "uri"

    const-string v4, "id"

    invoke-virtual {v2, v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 55
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    const-string p2, "image"

    const-string v1, "cover"

    const-string v3, "artwork"

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, p2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, p2

    goto :goto_2

    .line 52
    :cond_3
    :goto_1
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 57
    :catch_0
    move-exception p2

    :cond_4
    :goto_2
    nop

    .line 58
    sget-object p2, Lcom/melodix/music/GlassScreenStyler;->artwork:Ljava/util/WeakHashMap;

    invoke-virtual {p2, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map;

    .line 59
    if-nez p2, :cond_5

    new-instance p2, Ljava/util/LinkedHashMap;

    invoke-direct {p2}, Ljava/util/LinkedHashMap;-><init>()V

    sget-object v1, Lcom/melodix/music/GlassScreenStyler;->artwork:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, p2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    :cond_5
    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result p0

    const/16 v1, 0x20

    if-lt p0, v1, :cond_6

    invoke-interface {p2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6

    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p2, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    :cond_6
    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    return-void

    .line 48
    :cond_7
    :goto_3
    return-void
.end method

.method private static rowContainer(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;
    .locals 4

    .line 72
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    .line 73
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    .line 75
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 76
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lez v1, :cond_1

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->removeViewAt(I)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_0

    .line 77
    :cond_1
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method private static selectedArtwork(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 63
    sget-object v0, Lcom/melodix/music/GlassScreenStyler;->artwork:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    const-string v0, ""

    if-nez p0, :cond_1

    :cond_0
    goto :goto_0

    :cond_1
    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    move-object v0, p0

    check-cast v0, Ljava/lang/String;

    :goto_0
    return-object v0
.end method

.method private static settings(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .locals 8

    .line 164
    invoke-static {p1}, Lcom/melodix/music/GlassScreenStyler;->rowContainer(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object p1

    .line 165
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    const/4 v3, 0x1

    if-ge v1, v2, :cond_2

    .line 166
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 167
    instance-of v4, v2, Landroid/widget/TextView;

    if-eqz v4, :cond_0

    .line 168
    check-cast v2, Landroid/widget/TextView;

    const/high16 v4, 0x41600000    # 14.0f

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextSize(F)V

    const v4, -0x324901

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    sget-object v4, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v2, v4, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 169
    const/high16 v3, 0x40800000    # 4.0f

    invoke-static {p0, v3}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v4

    const/high16 v5, 0x41b00000    # 22.0f

    invoke-static {p0, v5}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-static {p0, v3}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v3

    const/high16 v6, 0x41200000    # 10.0f

    invoke-static {p0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    invoke-virtual {v2, v4, v5, v3, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 170
    goto :goto_1

    :cond_0
    instance-of v3, v2, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_1

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-static {p0, v2}, Lcom/melodix/music/GlassScreenStyler;->styleSettingRow(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    .line 165
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 172
    :cond_2
    invoke-static {p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    .line 173
    const/high16 v2, 0x41900000    # 18.0f

    invoke-static {p0, v2}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v4

    invoke-static {p0, v2}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-static {p0, v2}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    invoke-static {p0, v2}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-virtual {v1, v4, v5, v6, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 174
    const v2, -0x29dee5d0

    const v4, 0x50ffffff

    const v5, -0x17a4c980

    const/16 v6, 0x16

    invoke-static {p0, v5, v2, v6, v4}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 175
    const/16 v2, 0xa

    const v4, -0x1a2a01

    const-string v5, "MELODIX  \u2022  VOTRE ESPACE"

    invoke-static {p0, v5, v2, v4, v3}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    const v4, 0x3df5c28f    # 0.12f

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setLetterSpacing(F)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 176
    const-string v2, "Votre musique,\n\u00e0 votre fa\u00e7on."

    const v4, -0x70a01

    invoke-static {p0, v2, v6, v4, v3}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    .line 177
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x40e00000    # 7.0f

    invoke-static {p0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 178
    const/16 v2, 0xc

    const v3, -0x26331b

    const-string v6, "Personnalisez votre exp\u00e9rience."

    invoke-static {p0, v6, v2, v3, v0}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    .line 179
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x40c00000    # 6.0f

    invoke-static {p0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    iput v7, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 180
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result p0

    iput p0, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 181
    invoke-virtual {p1, v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 182
    return-void
.end method

.method public static style(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 65
    if-eqz p0, :cond_4

    if-nez p1, :cond_0

    goto :goto_1

    .line 66
    :cond_0
    const-string v0, "settings"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p0, p1}, Lcom/melodix/music/GlassScreenStyler;->settings(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    goto :goto_0

    .line 67
    :cond_1
    const-string v0, "detail"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {p3}, Lcom/melodix/music/GlassScreenStyler;->playlist(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {p0, p1, p3, p4}, Lcom/melodix/music/GlassScreenStyler;->playlist(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 68
    :cond_2
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {p3}, Lcom/melodix/music/GlassScreenStyler;->liked(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {p0, p1, p3, p4}, Lcom/melodix/music/GlassScreenStyler;->playlist(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    :cond_3
    :goto_0
    invoke-static {p0, p1, p2, p3}, Lcom/melodix/music/GlassLikedMotion;->bind(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    return-void

    .line 65
    :cond_4
    :goto_1
    return-void
.end method

.method private static styleSettingRow(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .locals 13

    .line 184
    nop

    .line 185
    const/4 v0, 0x0

    const/4 v1, 0x0

    move-object v3, v0

    move-object v5, v3

    move v2, v1

    move v4, v2

    :goto_0
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v6

    const/4 v7, 0x1

    if-ge v2, v6, :cond_3

    .line 186
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 187
    instance-of v8, v6, Landroid/widget/ImageView;

    if-eqz v8, :cond_0

    move v4, v7

    goto :goto_1

    .line 188
    :cond_0
    instance-of v7, v6, Landroid/widget/LinearLayout;

    if-eqz v7, :cond_1

    move-object v3, v6

    check-cast v3, Landroid/widget/LinearLayout;

    goto :goto_1

    .line 189
    :cond_1
    instance-of v7, v6, Landroid/widget/TextView;

    if-eqz v7, :cond_2

    move-object v5, v6

    check-cast v5, Landroid/widget/TextView;

    .line 185
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 191
    :cond_3
    if-eqz v3, :cond_10

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/TextView;

    if-nez v2, :cond_4

    goto/16 :goto_5

    .line 192
    :cond_4
    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    const/high16 v6, 0x41700000    # 15.0f

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setTextSize(F)V

    const v6, -0x70a01

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v8, 0x2

    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 193
    move v9, v7

    :goto_2
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v10

    const/high16 v11, 0x41400000    # 12.0f

    if-ge v9, v10, :cond_6

    invoke-virtual {v3, v9}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    instance-of v10, v10, Landroid/widget/TextView;

    if-eqz v10, :cond_5

    .line 194
    invoke-virtual {v3, v9}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextSize(F)V

    const v11, -0x424b36

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v11, 0x3

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 193
    :cond_5
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 196
    :cond_6
    invoke-static {p0, v11}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v3

    const/high16 v9, 0x41500000    # 13.0f

    invoke-static {p0, v9}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v10

    invoke-static {p0, v11}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v12

    invoke-static {p0, v9}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v9

    invoke-virtual {p1, v3, v10, v12, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/high16 v3, 0x42900000    # 72.0f

    invoke-static {p0, v3}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 197
    const v3, -0x2ae4e8da

    const/16 v9, 0x14

    const v10, -0x37c7d3b7

    const v12, 0x30ffffff

    invoke-static {p0, v10, v3, v9, v12}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    .line 198
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->isClickable()Z

    move-result v9

    if-eqz v9, :cond_7

    new-instance v9, Landroid/graphics/drawable/RippleDrawable;

    const v10, 0x55c9a8ff

    invoke-static {v10}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v10

    invoke-direct {v9, v10, v3, v0}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    move-object v3, v9

    :cond_7
    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 199
    if-nez v4, :cond_8

    .line 200
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/GlassScreenStyler;->glyph(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x13

    const v3, -0x1c2d01

    invoke-static {p0, v0, v2, v3, v7}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v0

    const/16 v2, 0x11

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 201
    const v2, -0x779cbc7e

    const/16 v3, 0xc

    const v4, -0x557fa856

    invoke-static {p0, v4, v2, v3, v12}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 202
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    .line 203
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x42200000    # 40.0f

    invoke-static {p0, v3}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v4

    invoke-static {p0, v3}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p0, v11}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    invoke-virtual {p1, v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 205
    :cond_8
    if-eqz v5, :cond_e

    .line 206
    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "ON"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    .line 207
    const-string v2, "Indisponible"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    .line 208
    if-eqz v1, :cond_9

    const v2, -0x57920e

    goto :goto_3

    :cond_9
    if-eqz v0, :cond_a

    const v2, 0x664a4253

    goto :goto_3

    :cond_a
    const v2, -0x7792a284

    .line 209
    :goto_3
    if-eqz v1, :cond_b

    const v1, -0x28ae5b

    goto :goto_4

    :cond_b
    if-eqz v0, :cond_c

    const v1, 0x66403a49

    goto :goto_4

    :cond_c
    const v1, -0x779fb08e

    .line 210
    :goto_4
    const/16 v3, 0x10

    const v4, 0x22ffffff

    invoke-static {p0, v2, v1, v3, v4}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    if-eqz v0, :cond_d

    const v6, -0x3f4638

    :cond_d
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 211
    const/high16 v0, 0x41300000    # 11.0f

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setTextSize(F)V

    const/high16 v0, 0x41200000    # 10.0f

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v1

    const/high16 v2, 0x40e00000    # 7.0f

    invoke-static {p0, v2}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v0

    invoke-static {p0, v2}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-virtual {v5, v1, v3, v0, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 212
    const/high16 v0, 0x42e00000    # 112.0f

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v0

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setMaxWidth(I)V

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 214
    :cond_e
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 215
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v1, :cond_f

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {p0, v1}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result p0

    iput p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 216
    :cond_f
    return-void

    .line 191
    :cond_10
    :goto_5
    return-void
.end method

.method private static text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;
    .locals 1

    .line 34
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    int-to-float p0, p2

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    if-eqz p4, :cond_0

    sget-object p0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 p1, 0x1

    invoke-virtual {v0, p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    :cond_0
    return-object v0
.end method

.method private static tint(Landroid/widget/LinearLayout;Landroid/widget/ImageView;I)V
    .locals 17

    .line 140
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    const/16 v3, 0x1e

    if-le v2, v3, :cond_0

    return-void

    .line 141
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 142
    instance-of v4, v3, Landroid/graphics/drawable/BitmapDrawable;

    const/4 v5, 0x1

    if-eqz v4, :cond_4

    check-cast v3, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v4

    if-nez v4, :cond_1

    move-object v3, v0

    goto/16 :goto_3

    .line 145
    :cond_1
    invoke-virtual {v3}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    .line 147
    const/16 v2, 0x8

    :try_start_0
    invoke-static {v1, v2, v2, v5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 148
    const-wide/16 v6, 0x0

    move-wide v8, v6

    move-wide v10, v8

    move-wide v12, v10

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_3

    const/4 v14, 0x0

    :goto_1
    if-ge v14, v2, :cond_2

    invoke-virtual {v1, v14, v4}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v15

    invoke-static {v15}, Landroid/graphics/Color;->red(I)I

    move-result v2

    invoke-static {v15}, Landroid/graphics/Color;->green(I)I

    move-result v3

    invoke-static {v15}, Landroid/graphics/Color;->blue(I)I

    move-result v5

    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v15}, Landroid/graphics/Color;->red(I)I

    move-result v3

    invoke-static {v15}, Landroid/graphics/Color;->green(I)I

    move-result v5

    move-object/from16 v16, v1

    invoke-static {v15}, Landroid/graphics/Color;->blue(I)I

    move-result v1

    invoke-static {v5, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    sub-int/2addr v2, v1

    div-int/lit8 v2, v2, 0x18

    const/4 v1, 0x1

    add-int/2addr v2, v1

    invoke-static {v15}, Landroid/graphics/Color;->red(I)I

    move-result v1

    mul-int/2addr v1, v2

    int-to-long v0, v1

    add-long/2addr v6, v0

    invoke-static {v15}, Landroid/graphics/Color;->green(I)I

    move-result v0

    mul-int/2addr v0, v2

    int-to-long v0, v0

    add-long/2addr v10, v0

    invoke-static {v15}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    mul-int/2addr v0, v2

    int-to-long v0, v0

    add-long/2addr v12, v0

    int-to-long v0, v2

    add-long/2addr v8, v0

    add-int/lit8 v14, v14, 0x1

    const/16 v2, 0x8

    const/4 v5, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    goto :goto_1

    :cond_2
    move-object/from16 v16, v1

    add-int/lit8 v4, v4, 0x1

    const/16 v2, 0x8

    const/4 v5, 0x1

    move-object/from16 v0, p0

    goto :goto_0

    .line 149
    :cond_3
    const/4 v0, 0x3

    new-array v0, v0, [F

    div-long/2addr v6, v8

    long-to-int v1, v6

    div-long/2addr v10, v8

    long-to-int v2, v10

    div-long/2addr v12, v8

    long-to-int v3, v12

    invoke-static {v1, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-static {v1, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    const/4 v1, 0x1

    aget v2, v0, v1

    const v3, 0x3fa66666    # 1.3f

    mul-float/2addr v2, v3

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x2

    aget v2, v0, v1

    const v3, 0x3eb33333    # 0.35f

    invoke-static {v3, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    const v3, 0x3f4ccccd    # 0.8f

    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    aput v2, v0, v1

    .line 150
    invoke-virtual/range {p0 .. p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v0

    invoke-static {v1, v0}, Lcom/melodix/music/GlassScreenStyler;->glow(Landroid/content/Context;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    move-object/from16 v3, p0

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 151
    :catch_0
    move-exception v0

    :goto_2
    nop

    .line 152
    return-void

    .line 142
    :cond_4
    move-object v3, v0

    .line 143
    :goto_3
    new-instance v0, Lcom/melodix/music/GlassScreenStyler;

    const/4 v4, 0x1

    add-int/2addr v2, v4

    invoke-direct {v0, v3, v1, v2}, Lcom/melodix/music/GlassScreenStyler;-><init>(Landroid/widget/LinearLayout;Landroid/widget/ImageView;I)V

    const-wide/16 v2, 0x96

    invoke-virtual {v1, v0, v2, v3}, Landroid/widget/ImageView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private static vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;
    .locals 1

    .line 37
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 132
    iget-object v0, p0, Lcom/melodix/music/GlassScreenStyler;->waitImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/melodix/music/GlassScreenStyler;->waitTries:I

    const/4 v1, 0x4

    if-ge v0, v1, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/GlassScreenStyler;->waitHero:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/melodix/music/GlassScreenStyler;->waitImage:Landroid/widget/ImageView;

    iget v2, p0, Lcom/melodix/music/GlassScreenStyler;->waitTries:I

    invoke-static {v0, v1, v2}, Lcom/melodix/music/GlassScreenStyler;->tint(Landroid/widget/LinearLayout;Landroid/widget/ImageView;I)V

    :cond_1
    return-void
.end method
