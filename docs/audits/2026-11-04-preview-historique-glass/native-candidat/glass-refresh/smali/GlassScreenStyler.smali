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
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/melodix/music/GlassScreenStyler;->artwork:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static dp(Landroid/content/Context;F)I
    .locals 0

    .line 27
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

    .line 29
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TL_BR:Landroid/graphics/drawable/GradientDrawable$Orientation;

    filled-new-array {p1, p2}, [I

    move-result-object p1

    invoke-direct {v0, v1, p1}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 30
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

.method private static glyph(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 117
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 118
    const-string v0, "compte"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_9

    const-string v0, "profil"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_3

    .line 119
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

    .line 120
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

    .line 121
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

    .line 122
    :cond_3
    const-string v0, "d\u00e9connexion"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string p0, "\u2197"

    return-object p0

    .line 123
    :cond_4
    const-string v0, "melodix"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_5

    const-string p0, "M"

    return-object p0

    .line 124
    :cond_5
    const-string p0, "\u2726"

    return-object p0

    .line 121
    :cond_6
    :goto_0
    const-string p0, "\u25a6"

    return-object p0

    .line 120
    :cond_7
    :goto_1
    const-string p0, "\u25b6"

    return-object p0

    .line 119
    :cond_8
    :goto_2
    const-string p0, "\u266b"

    return-object p0

    .line 118
    :cond_9
    :goto_3
    const-string p0, "\u25c9"

    return-object p0
.end method

.method static liked(Ljava/lang/String;)Z
    .locals 1

    .line 41
    if-eqz p0, :cond_1

    const-string v0, "spotify:collection:tracks"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 42
    const-string v0, "(?i)^https://open\\.spotify\\.com/(?:intl-[a-z]{2}(?:-[a-z]{2})?/)?collection/tracks/?(?:\\?[^#]*)?(?:#.*)?$"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    :cond_0
    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    .line 41
    :goto_0
    return p0
.end method

.method private static playlist(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V
    .locals 17

    .line 79
    move-object/from16 v0, p0

    invoke-static/range {p1 .. p1}, Lcom/melodix/music/GlassScreenStyler;->rowContainer(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v1

    .line 80
    const-string v2, "glass-old-playlist-heading"

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    .line 81
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-ne v3, v1, :cond_0

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 82
    :cond_0
    invoke-static/range {p2 .. p2}, Lcom/melodix/music/GlassScreenStyler;->liked(Ljava/lang/String;)Z

    move-result v2

    .line 83
    invoke-static/range {p0 .. p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v3

    const-string v4, "glass-playlist-hero"

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const/high16 v4, 0x41400000    # 12.0f

    invoke-static {v0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-static {v0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    invoke-static {v0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v4

    const/high16 v7, 0x41600000    # 14.0f

    invoke-static {v0, v7}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-virtual {v3, v5, v6, v4, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 85
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v5, 0x11

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 86
    new-instance v6, Landroid/widget/ImageView;

    invoke-direct {v6, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v7, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 87
    const v7, -0xdbe6c3

    const v8, 0x45ffffff    # 8191.9995f

    const v9, -0x91c363

    const/16 v10, 0xe

    invoke-static {v0, v9, v7, v10, v8}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 88
    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setClipToOutline(Z)V

    const/4 v8, 0x2

    invoke-virtual {v6, v8}, Landroid/widget/ImageView;->setImportantForAccessibility(I)V

    .line 89
    move-object/from16 v9, p2

    invoke-static {v0, v9}, Lcom/melodix/music/GlassScreenStyler;->selectedArtwork(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 90
    invoke-static/range {p0 .. p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v11

    invoke-virtual {v11, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 91
    if-eqz v2, :cond_1

    const v12, -0xc9d26c

    const v13, 0x35ffffff

    const v14, -0x7fa91b

    goto :goto_0

    :cond_1
    const v12, -0xd8dfc8

    const v13, 0x4affffff    # 8388607.5f

    const v14, -0x89b059

    :goto_0
    invoke-static {v0, v14, v12, v10, v13}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v12

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 92
    const v12, 0x3e23d70a    # 0.16f

    const/16 v13, 0xa

    const-string v14, "PLAYLIST"

    const v15, -0x70a01

    const/4 v10, -0x1

    if-eqz v9, :cond_2

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v16

    if-nez v16, :cond_2

    .line 93
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v10, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v6, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    const/high16 v5, 0x43480000    # 200.0f

    invoke-static {v0, v5}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-static {v6, v9, v5}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V

    goto :goto_3

    .line 98
    :cond_2
    if-eqz v2, :cond_3

    const-string v6, "\u2665\ufe0e"

    goto :goto_1

    :cond_3
    const-string v6, "\u266b"

    :goto_1
    if-eqz v2, :cond_4

    const/16 v9, 0x48

    goto :goto_2

    :cond_4
    const/16 v9, 0x3a

    :goto_2
    xor-int/lit8 v10, v2, 0x1

    invoke-static {v0, v6, v9, v15, v10}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 99
    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    invoke-virtual {v11, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 100
    if-nez v2, :cond_5

    .line 101
    const v6, -0x19230f

    invoke-static {v0, v14, v13, v6, v7}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v6, v12}, Landroid/widget/TextView;->setLetterSpacing(F)V

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 102
    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    invoke-virtual {v11, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 105
    :cond_5
    :goto_3
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x43000000    # 128.0f

    invoke-static {v0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v8

    invoke-static {v0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    invoke-direct {v5, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v11, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 106
    invoke-static/range {p0 .. p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v5

    const/high16 v6, 0x41800000    # 16.0f

    invoke-static {v0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    const/4 v8, 0x0

    invoke-virtual {v5, v6, v8, v8, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x2

    const/4 v10, -0x1

    invoke-direct {v6, v10, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 107
    if-eqz v2, :cond_6

    const-string v14, "VOTRE BIBLIOTH\u00c8QUE"

    :cond_6
    const v4, -0x324901

    invoke-static {v0, v14, v13, v4, v7}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4, v12}, Landroid/widget/TextView;->setLetterSpacing(F)V

    .line 108
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v10, -0x1

    invoke-direct {v6, v10, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 109
    if-eqz p3, :cond_8

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_7

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
    const/16 v4, 0x16

    invoke-static {v0, v2, v4, v15, v7}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    .line 110
    const/4 v4, 0x3

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 111
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    invoke-direct {v4, v6, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x40800000    # 4.0f

    invoke-static {v0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    iput v6, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v5, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    const-string v2, "Titres"

    const/16 v4, 0xe

    invoke-static {v0, v2, v4, v15, v7}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    const v4, 0x3ca3d70a    # 0.02f

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setLetterSpacing(F)V

    .line 113
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v4, v5, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x41a00000    # 20.0f

    invoke-static {v0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v0

    iput v0, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v3, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 114
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v5, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v8, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 115
    return-void
.end method

.method static playlist(Ljava/lang/String;)Z
    .locals 1

    .line 38
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

    .line 47
    const-string v0, ""

    if-eqz p0, :cond_7

    invoke-static {p1}, Lcom/melodix/music/GlassScreenStyler;->playlist(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_3

    .line 48
    :cond_0
    nop

    .line 50
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    if-nez p2, :cond_1

    const-string p2, "[]"

    :cond_1
    invoke-direct {v1, p2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 51
    const/4 p2, 0x0

    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge p2, v2, :cond_4

    .line 52
    invoke-virtual {v1, p2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    if-nez v2, :cond_2

    goto :goto_1

    .line 53
    :cond_2
    const-string v3, "uri"

    const-string v4, "id"

    invoke-virtual {v2, v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 54
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

    .line 51
    :cond_3
    :goto_1
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 56
    :catch_0
    move-exception p2

    :cond_4
    :goto_2
    nop

    .line 57
    sget-object p2, Lcom/melodix/music/GlassScreenStyler;->artwork:Ljava/util/WeakHashMap;

    invoke-virtual {p2, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map;

    .line 58
    if-nez p2, :cond_5

    new-instance p2, Ljava/util/LinkedHashMap;

    invoke-direct {p2}, Ljava/util/LinkedHashMap;-><init>()V

    sget-object v1, Lcom/melodix/music/GlassScreenStyler;->artwork:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, p2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
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

    .line 60
    :cond_6
    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    return-void

    .line 47
    :cond_7
    :goto_3
    return-void
.end method

.method private static rowContainer(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;
    .locals 4

    .line 71
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    .line 72
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    .line 74
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 75
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lez v1, :cond_1

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->removeViewAt(I)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_0

    .line 76
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

    .line 62
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

    .line 127
    invoke-static {p1}, Lcom/melodix/music/GlassScreenStyler;->rowContainer(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object p1

    .line 128
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    const/4 v3, 0x1

    if-ge v1, v2, :cond_2

    .line 129
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 130
    instance-of v4, v2, Landroid/widget/TextView;

    if-eqz v4, :cond_0

    .line 131
    check-cast v2, Landroid/widget/TextView;

    const/high16 v4, 0x41600000    # 14.0f

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextSize(F)V

    const v4, -0x324901

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    sget-object v4, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v2, v4, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 132
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

    .line 133
    goto :goto_1

    :cond_0
    instance-of v3, v2, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_1

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-static {p0, v2}, Lcom/melodix/music/GlassScreenStyler;->styleSettingRow(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    .line 128
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 135
    :cond_2
    invoke-static {p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    .line 136
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

    .line 137
    const v2, -0x29dee5d0

    const v4, 0x50ffffff

    const v5, -0x17a4c980

    const/16 v6, 0x16

    invoke-static {p0, v5, v2, v6, v4}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 138
    const/16 v2, 0xa

    const v4, -0x1a2a01

    const-string v5, "MELODIX  \u2022  VOTRE ESPACE"

    invoke-static {p0, v5, v2, v4, v3}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    const v4, 0x3df5c28f    # 0.12f

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setLetterSpacing(F)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 139
    const-string v2, "Votre musique,\n\u00e0 votre fa\u00e7on."

    const v4, -0x70a01

    invoke-static {p0, v2, v6, v4, v3}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    .line 140
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x40e00000    # 7.0f

    invoke-static {p0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 141
    const/16 v2, 0xc

    const v3, -0x26331b

    const-string v6, "Personnalisez votre exp\u00e9rience."

    invoke-static {p0, v6, v2, v3, v0}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    .line 142
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x40c00000    # 6.0f

    invoke-static {p0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    iput v7, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 143
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result p0

    iput p0, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 144
    invoke-virtual {p1, v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 145
    return-void
.end method

.method public static style(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 64
    if-eqz p0, :cond_4

    if-nez p1, :cond_0

    goto :goto_1

    .line 65
    :cond_0
    const-string v0, "settings"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p0, p1}, Lcom/melodix/music/GlassScreenStyler;->settings(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    goto :goto_0

    .line 66
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

    .line 67
    :cond_2
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {p3}, Lcom/melodix/music/GlassScreenStyler;->liked(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {p0, p1, p3, p4}, Lcom/melodix/music/GlassScreenStyler;->playlist(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    :cond_3
    :goto_0
    invoke-static {p0, p1, p2, p3}, Lcom/melodix/music/GlassLikedMotion;->bind(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    return-void

    .line 64
    :cond_4
    :goto_1
    return-void
.end method

.method private static styleSettingRow(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .locals 13

    .line 147
    nop

    .line 148
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

    .line 149
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 150
    instance-of v8, v6, Landroid/widget/ImageView;

    if-eqz v8, :cond_0

    move v4, v7

    goto :goto_1

    .line 151
    :cond_0
    instance-of v7, v6, Landroid/widget/LinearLayout;

    if-eqz v7, :cond_1

    move-object v3, v6

    check-cast v3, Landroid/widget/LinearLayout;

    goto :goto_1

    .line 152
    :cond_1
    instance-of v7, v6, Landroid/widget/TextView;

    if-eqz v7, :cond_2

    move-object v5, v6

    check-cast v5, Landroid/widget/TextView;

    .line 148
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 154
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

    .line 155
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

    .line 156
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

    .line 157
    invoke-virtual {v3, v9}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextSize(F)V

    const v11, -0x424b36

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v11, 0x3

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 156
    :cond_5
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 159
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

    .line 160
    const v3, -0x2ae4e8da

    const/16 v9, 0x14

    const v10, -0x37c7d3b7

    const v12, 0x30ffffff

    invoke-static {p0, v10, v3, v9, v12}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    .line 161
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

    .line 162
    if-nez v4, :cond_8

    .line 163
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

    .line 164
    const v2, -0x779cbc7e

    const/16 v3, 0xc

    const v4, -0x557fa856

    invoke-static {p0, v4, v2, v3, v12}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 165
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    .line 166
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

    .line 168
    :cond_8
    if-eqz v5, :cond_e

    .line 169
    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "ON"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    .line 170
    const-string v2, "Indisponible"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    .line 171
    if-eqz v1, :cond_9

    const v2, -0x57920e

    goto :goto_3

    :cond_9
    if-eqz v0, :cond_a

    const v2, 0x664a4253

    goto :goto_3

    :cond_a
    const v2, -0x7792a284

    .line 172
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

    .line 173
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

    .line 174
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

    .line 175
    const/high16 v0, 0x42e00000    # 112.0f

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v0

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setMaxWidth(I)V

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 177
    :cond_e
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 178
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v1, :cond_f

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {p0, v1}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result p0

    iput p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 179
    :cond_f
    return-void

    .line 154
    :cond_10
    :goto_5
    return-void
.end method

.method private static text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;
    .locals 1

    .line 33
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    int-to-float p0, p2

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    if-eqz p4, :cond_0

    sget-object p0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 p1, 0x1

    invoke-virtual {v0, p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    :cond_0
    return-object v0
.end method

.method private static vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;
    .locals 1

    .line 36
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    return-object v0
.end method
