.class public final Lcom/melodix/music/GlassScreenStyler;
.super Ljava/lang/Object;
.source "GlassScreenStyler.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final DISCOVER:Ljava/lang/String; = "\u00c0 d\u00e9couvrir sur Spotify"

.field private static final LIB:Ljava/lang/String; = "Votre biblioth\u00e8que"

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

    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/melodix/music/GlassScreenStyler;->waitHero:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lcom/melodix/music/GlassScreenStyler;->waitImage:Landroid/widget/ImageView;

    iput p3, p0, Lcom/melodix/music/GlassScreenStyler;->waitTries:I

    return-void
.end method

.method private static cards(Landroid/view/View;)Landroid/widget/LinearLayout;
    .locals 3

    .line 234
    instance-of v0, p0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    instance-of v0, p0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    check-cast p0, Landroid/view/ViewGroup;

    .line 235
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_1

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Landroid/widget/LinearLayout;

    :cond_1
    return-object v1

    .line 234
    :cond_2
    :goto_0
    return-object v1
.end method

.method private static chip(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;
    .locals 4

    .line 170
    const v0, -0x19000001

    const/4 v1, 0x0

    const/16 v2, 0xc

    invoke-static {p0, p1, v2, v0, v1}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object p1

    const/high16 v0, 0x41400000    # 12.0f

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v1

    const/high16 v2, 0x40c00000    # 6.0f

    invoke-static {p0, v2}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v0

    invoke-static {p0, v2}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-virtual {p1, v1, v3, v0, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    const/16 v0, 0xe

    const v1, 0x1fffffff

    const v2, 0x1affffff

    const v3, 0xdffffff

    invoke-static {p0, v2, v3, v0, v1}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 171
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {p0, v1}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result p0

    iput p0, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p1
.end method

.method private static compact(Landroid/content/Context;Landroid/view/View;)V
    .locals 7

    .line 239
    instance-of v0, p1, Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    return-void

    :cond_0
    check-cast p1, Landroid/widget/LinearLayout;

    .line 240
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0x10

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 241
    const v1, 0x14ffffff

    const/4 v2, 0x6

    const v3, 0x1fffffff

    invoke-static {p0, v3, v1, v2, v0}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setClipToOutline(Z)V

    .line 242
    move v2, v0

    :goto_0
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_4

    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 243
    if-nez v2, :cond_1

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x42600000    # 56.0f

    invoke-static {p0, v5}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    invoke-static {p0, v5}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-direct {v4, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_3

    .line 244
    :cond_1
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v4, v0, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/high16 v4, 0x41200000    # 10.0f

    invoke-static {p0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v4

    const/high16 v5, 0x41000000    # 8.0f

    invoke-static {p0, v5}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-virtual {v3, v4, v0, v5, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 245
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v3, v4}, Lcom/melodix/music/GlassScreenStyler;->textViews(Landroid/view/View;Ljava/util/List;)V

    .line 246
    move v3, v0

    :goto_1
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-ge v3, v5, :cond_3

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    if-nez v3, :cond_2

    const/high16 v6, 0x41500000    # 13.0f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    const-string v6, "sans-serif-medium"

    invoke-static {v6, v0}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v6

    invoke-virtual {v5, v6, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    goto :goto_2

    :cond_2
    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 242
    :cond_3
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 247
    :cond_4
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

.method private static eyebrow(Landroid/widget/TextView;)V
    .locals 2

    .line 252
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/high16 v0, 0x41300000    # 11.0f

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    const v0, -0x73000001

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    const v0, 0x3e0f5c29    # 0.14f

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setLetterSpacing(F)V

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->FRENCH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
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

    .line 255
    const v0, 0xffffff

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    and-int/2addr v0, p1

    .line 256
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

    .line 257
    const/high16 p1, 0x41a00000    # 20.0f

    invoke-static {p0, p1}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {v1, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v1
.end method

.method private static glyph(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 275
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 276
    const-string v0, "compte"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_9

    const-string v0, "profil"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_3

    .line 277
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

    .line 278
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

    .line 279
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

    .line 280
    :cond_3
    const-string v0, "d\u00e9connexion"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string p0, "\u2197"

    return-object p0

    .line 281
    :cond_4
    const-string v0, "melodix"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_5

    const-string p0, "M"

    return-object p0

    .line 282
    :cond_5
    const-string p0, "\u2726"

    return-object p0

    .line 279
    :cond_6
    :goto_0
    const-string p0, "\u25a6"

    return-object p0

    .line 278
    :cond_7
    :goto_1
    const-string p0, "\u25b6"

    return-object p0

    .line 277
    :cond_8
    :goto_2
    const-string p0, "\u266b"

    return-object p0

    .line 276
    :cond_9
    :goto_3
    const-string p0, "\u25c9"

    return-object p0
.end method

.method private static heading(Landroid/widget/TextView;)V
    .locals 2

    .line 253
    const/high16 v0, 0x41b00000    # 22.0f

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    const v0, -0x50506

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    const-string v0, "sans-serif-medium"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    return-void
.end method

.method private static home(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .locals 17

    .line 209
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p1 .. p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v2, v4, :cond_0

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_0

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    .line 210
    :cond_0
    const-string v2, "glass-home-head"

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_1

    return-void

    .line 211
    :cond_1
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 212
    const/4 v6, 0x0

    const-string v7, ""

    move v8, v3

    move-object v9, v6

    :goto_0
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v10

    if-ge v8, v10, :cond_6

    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    .line 213
    instance-of v11, v10, Landroid/widget/TextView;

    const-string v12, "Votre biblioth\u00e8que"

    if-eqz v11, :cond_4

    move-object v11, v10

    check-cast v11, Landroid/widget/TextView;

    invoke-virtual {v11}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    .line 214
    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_3

    const-string v14, "\u00c0 d\u00e9couvrir sur Spotify"

    invoke-virtual {v14, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_2

    goto :goto_1

    :cond_2
    invoke-static {v11}, Lcom/melodix/music/GlassScreenStyler;->heading(Landroid/widget/TextView;)V

    goto :goto_2

    :cond_3
    :goto_1
    invoke-static {v11}, Lcom/melodix/music/GlassScreenStyler;->eyebrow(Landroid/widget/TextView;)V

    move-object v7, v13

    .line 215
    :goto_2
    invoke-virtual {v12, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    if-nez v9, :cond_5

    invoke-interface {v5, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 216
    :cond_4
    invoke-virtual {v12, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    if-nez v9, :cond_5

    invoke-static {v10}, Lcom/melodix/music/GlassScreenStyler;->cards(Landroid/view/View;)Landroid/widget/LinearLayout;

    move-result-object v9

    if-eqz v9, :cond_5

    invoke-interface {v5, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 212
    :cond_5
    :goto_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 217
    :cond_6
    invoke-static/range {p0 .. p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v7

    invoke-virtual {v7, v2}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const/high16 v2, 0x41800000    # 16.0f

    invoke-static {v0, v2}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v8

    const/high16 v10, 0x40800000    # 4.0f

    invoke-static {v0, v10}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v10

    invoke-static {v0, v2}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v2

    const/high16 v11, 0x41000000    # 8.0f

    invoke-static {v0, v11}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v12

    invoke-virtual {v7, v8, v10, v2, v12}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 218
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    const/16 v8, 0xb

    invoke-virtual {v2, v8}, Ljava/util/Calendar;->get(I)I

    move-result v2

    .line 219
    const/4 v8, 0x5

    const/16 v10, 0xc

    if-lt v2, v8, :cond_7

    if-ge v2, v10, :cond_7

    const-string v2, "Bonjour"

    goto :goto_4

    :cond_7
    if-lt v2, v10, :cond_8

    const/16 v8, 0x12

    if-ge v2, v8, :cond_8

    const-string v2, "Bon apr\u00e8s-midi"

    goto :goto_4

    :cond_8
    const-string v2, "Bonsoir"

    :goto_4
    const/16 v8, 0x1a

    const v10, -0x50506

    invoke-static {v0, v2, v8, v10, v4}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v7, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 221
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 222
    const/16 v8, 0x8

    if-eqz v9, :cond_a

    move v10, v3

    :goto_5
    invoke-virtual {v9}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v12

    if-ge v10, v12, :cond_a

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v12

    if-ge v12, v8, :cond_a

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    invoke-virtual {v12}, Landroid/view/View;->isClickable()Z

    move-result v12

    if-eqz v12, :cond_9

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    invoke-interface {v2, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_9
    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    .line 223
    :cond_a
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v10

    const/4 v12, -0x2

    const/4 v13, -0x1

    const/4 v14, 0x2

    if-lt v10, v14, :cond_f

    invoke-static/range {p0 .. p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v10

    const-string v15, "glass-home-quick"

    invoke-virtual {v10, v15}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 224
    move v15, v3

    :goto_6
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v8

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v14, 0x42600000    # 56.0f

    if-ge v15, v8, :cond_d

    invoke-interface {v2, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/View;

    invoke-virtual {v9, v8}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 225
    rem-int/lit8 v16, v15, 0x2

    if-nez v16, :cond_b

    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v13, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {v0, v11}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v12

    iput v12, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v10, v6, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 226
    :cond_b
    invoke-static {v0, v8}, Lcom/melodix/music/GlassScreenStyler;->compact(Landroid/content/Context;Landroid/view/View;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v0, v14}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v12

    const/4 v14, 0x0

    invoke-direct {v3, v14, v12, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    if-nez v16, :cond_c

    invoke-static {v0, v11}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    :cond_c
    invoke-virtual {v6, v8, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 224
    add-int/lit8 v15, v15, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/16 v8, 0x8

    const/4 v12, -0x2

    const/4 v14, 0x2

    goto :goto_6

    .line 227
    :cond_d
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x2

    rem-int/2addr v2, v3

    const/4 v3, 0x1

    if-ne v2, v3, :cond_e

    new-instance v2, Landroid/view/View;

    invoke-direct {v2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v0, v14}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v8

    const/4 v11, 0x0

    invoke-direct {v3, v11, v8, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v6, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 228
    :cond_e
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v13, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v3, 0x41600000    # 14.0f

    invoke-static {v0, v3}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v0

    iput v0, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v7, v10, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 229
    invoke-virtual {v9}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-nez v0, :cond_f

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_7

    .line 230
    :cond_f
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v0, v13, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v2, 0x0

    invoke-virtual {v1, v7, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 231
    return-void
.end method

.method private static library(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .locals 12

    .line 184
    invoke-static {p1}, Lcom/melodix/music/GlassScreenStyler;->rowContainer(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object p1

    .line 185
    const-string v0, "glass-library-head"

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    return-void

    .line 186
    :cond_0
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 187
    const/4 v2, 0x0

    move v3, v2

    move v4, v3

    :goto_0
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v5

    const/4 v6, -0x1

    const/4 v7, 0x1

    if-ge v3, v5, :cond_8

    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 188
    instance-of v8, v5, Landroid/widget/TextView;

    if-eqz v8, :cond_1

    check-cast v5, Landroid/widget/TextView;

    invoke-static {v5}, Lcom/melodix/music/GlassScreenStyler;->heading(Landroid/widget/TextView;)V

    const/high16 v6, 0x41900000    # 18.0f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    goto/16 :goto_1

    .line 189
    :cond_1
    invoke-virtual {v5}, Landroid/view/View;->isClickable()Z

    move-result v8

    if-nez v8, :cond_2

    goto/16 :goto_1

    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 190
    const/16 v8, 0xa

    invoke-static {p0, v6, v6, v8, v2}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    .line 191
    new-instance v8, Landroid/graphics/drawable/RippleDrawable;

    const v9, 0x1fffffff

    invoke-static {v9}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v9

    const/4 v10, 0x0

    invoke-direct {v8, v9, v10, v6}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v5, v8}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 192
    instance-of v6, v5, Landroid/view/ViewGroup;

    if-eqz v6, :cond_3

    move-object v6, v5

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v8

    if-lez v8, :cond_3

    invoke-virtual {v6, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    instance-of v8, v8, Landroid/widget/ImageView;

    if-eqz v8, :cond_3

    invoke-virtual {v6, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    move-object v10, v6

    check-cast v10, Landroid/widget/ImageView;

    .line 193
    :cond_3
    if-eqz v10, :cond_5

    invoke-virtual {v10}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    if-nez v6, :cond_4

    const v6, -0xe7e7e5

    const/4 v8, 0x6

    const v9, -0xd5d5d2

    invoke-static {p0, v9, v6, v8, v2}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    invoke-virtual {v10, v6}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_4
    invoke-virtual {v10, v7}, Landroid/widget/ImageView;->setClipToOutline(Z)V

    .line 194
    :cond_5
    invoke-static {p0, v5}, Lcom/melodix/music/GlassScreenStyler;->track(Landroid/content/Context;Landroid/view/View;)V

    .line 196
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v5, v6}, Lcom/melodix/music/GlassScreenStyler;->texts(Landroid/view/View;Ljava/util/List;)V

    .line 197
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v5

    if-le v5, v7, :cond_7

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v6, "[\u2022\u00b7]"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    aget-object v5, v5, v2

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    const-string v6, "(?i)playlists?|albums?|artistes?|podcasts?|titres?"

    invoke-virtual {v5, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-virtual {v1, v5}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-virtual {v1, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/2addr v7, v6

    :cond_6
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    :cond_7
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 198
    :cond_8
    invoke-static {p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const/high16 v0, 0x41800000    # 16.0f

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    const/high16 v8, 0x41000000    # 8.0f

    invoke-static {p0, v8}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v8

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v0

    const/high16 v9, 0x41400000    # 12.0f

    invoke-static {p0, v9}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v9

    invoke-virtual {v3, v5, v8, v0, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 199
    const/16 v0, 0x1c

    const v5, -0x50506

    const-string v8, "Ta biblioth\u00e8que"

    invoke-static {p0, v8, v0, v5, v7}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 200
    new-instance v0, Ljava/lang/StringBuilder;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    if-le v4, v7, :cond_9

    const-string v8, " \u00e9l\u00e9ments"

    goto :goto_2

    :cond_9
    const-string v8, " \u00e9l\u00e9ment"

    :goto_2
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 201
    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    sget-object v9, Ljava/util/Locale;->FRENCH:Ljava/util/Locale;

    invoke-virtual {v8, v9}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "s$"

    const-string v10, ""

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, " \u00b7 "

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/16 v11, 0x20

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-le v5, v7, :cond_a

    const-string v10, "s"

    :cond_a
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 202
    :cond_b
    const/4 v1, -0x2

    if-lez v4, :cond_c

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v4, 0xd

    const v5, -0x66000001

    invoke-static {p0, v0, v4, v5, v2}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v0

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v6, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v5, 0x40800000    # 4.0f

    invoke-static {p0, v5}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result p0

    iput p0, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v3, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 203
    :cond_c
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v6, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v3, v2, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 204
    return-void
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
    .locals 21

    .line 82
    move-object/from16 v0, p0

    invoke-static/range {p1 .. p1}, Lcom/melodix/music/GlassScreenStyler;->rowContainer(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v1

    .line 83
    const-string v2, "glass-old-playlist-heading"

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    .line 84
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-ne v3, v1, :cond_0

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 85
    :cond_0
    invoke-static/range {p2 .. p2}, Lcom/melodix/music/GlassScreenStyler;->liked(Ljava/lang/String;)Z

    move-result v2

    .line 86
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

    .line 88
    const/4 v4, 0x0

    invoke-static {v0, v4}, Lcom/melodix/music/GlassScreenStyler;->glow(Landroid/content/Context;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 90
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v7, 0x11

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 91
    new-instance v8, Landroid/widget/ImageView;

    invoke-direct {v8, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v9, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 92
    const v9, 0x1fffffff

    const v10, 0xfffffff

    const/16 v11, 0xa

    invoke-static {v0, v9, v10, v11, v4}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v12

    invoke-virtual {v8, v12}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 93
    const/4 v12, 0x1

    invoke-virtual {v8, v12}, Landroid/widget/ImageView;->setClipToOutline(Z)V

    const/4 v13, 0x2

    invoke-virtual {v8, v13}, Landroid/widget/ImageView;->setImportantForAccessibility(I)V

    .line 94
    move-object/from16 v14, p2

    invoke-static {v0, v14}, Lcom/melodix/music/GlassScreenStyler;->selectedArtwork(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 95
    invoke-static/range {p0 .. p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v15

    invoke-virtual {v15, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 96
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

    move-result v10

    int-to-float v10, v10

    invoke-virtual {v15, v10}, Landroid/widget/LinearLayout;->setElevation(F)V

    .line 97
    const-string v10, "PLAYLIST"

    const v9, -0x66000001

    const/4 v6, -0x1

    if-eqz v14, :cond_2

    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v16

    if-nez v16, :cond_2

    .line 98
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v15, v8, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 99
    const/high16 v7, 0x43700000    # 240.0f

    invoke-static {v0, v7}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-static {v8, v14, v7}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V

    invoke-static {v3, v8, v4}, Lcom/melodix/music/GlassScreenStyler;->tint(Landroid/widget/LinearLayout;Landroid/widget/ImageView;I)V

    goto :goto_3

    .line 103
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
    xor-int/lit8 v6, v2, 0x1

    const v4, -0x70a01

    invoke-static {v0, v8, v14, v4, v6}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 104
    invoke-virtual {v4, v13}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    invoke-virtual {v15, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 105
    if-nez v2, :cond_5

    .line 106
    invoke-static {v0, v10, v11, v9, v12}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v4

    const v6, 0x3e23d70a    # 0.16f

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setLetterSpacing(F)V

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 107
    invoke-virtual {v4, v13}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    invoke-virtual {v15, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 110
    :cond_5
    :goto_3
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x430c0000    # 140.0f

    invoke-static {v0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-static {v0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    invoke-direct {v4, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v15, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 111
    invoke-static/range {p0 .. p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v4

    const/high16 v6, 0x41800000    # 16.0f

    invoke-static {v0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    const/4 v6, 0x0

    invoke-virtual {v4, v7, v6, v6, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2

    const/4 v8, -0x1

    invoke-direct {v6, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    if-eqz v2, :cond_6

    const-string v10, "VOTRE BIBLIOTH\u00c8QUE"

    :cond_6
    const/16 v5, 0xb

    const/4 v6, 0x0

    invoke-static {v0, v10, v5, v9, v6}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v5

    const-string v8, "sans-serif-medium"

    invoke-static {v8, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v10

    invoke-virtual {v5, v10, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    const v6, 0x3df5c28f    # 0.12f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setLetterSpacing(F)V

    .line 113
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v10, -0x1

    invoke-direct {v6, v10, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 114
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

    const v6, -0x50506

    const/4 v10, 0x0

    invoke-static {v0, v2, v5, v6, v10}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    .line 115
    invoke-static {v8, v10}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v2, v5, v10}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    const v5, -0x43dc28f6    # -0.01f

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setLetterSpacing(F)V

    const/4 v5, 0x0

    const v6, 0x3f866666    # 1.05f

    invoke-virtual {v2, v5, v6}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 116
    const/4 v5, 0x3

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 117
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x1

    invoke-direct {v6, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v8, 0x40c00000    # 6.0f

    invoke-static {v0, v8}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v8

    iput v8, v6, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v4, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 119
    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    new-instance v6, Ljava/util/LinkedHashMap;

    invoke-direct {v6}, Ljava/util/LinkedHashMap;-><init>()V

    .line 120
    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    :goto_6
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v11

    const-string v9, ""

    if-ge v8, v11, :cond_14

    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    if-eq v11, v3, :cond_13

    invoke-virtual {v11}, Landroid/view/View;->isClickable()Z

    move-result v17

    if-nez v17, :cond_a

    const/4 v13, 0x3

    goto/16 :goto_c

    :cond_a
    add-int/lit8 v10, v10, 0x1

    .line 121
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v11, v5}, Lcom/melodix/music/GlassScreenStyler;->texts(Landroid/view/View;Ljava/util/List;)V

    .line 122
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_7
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_d

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    const-string v19, "(?:^|\u2022 )(?:(\\d+):)?(\\d{1,2}):(\\d{2})$"

    invoke-static/range {v19 .. v19}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v13

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v13, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    .line 123
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->find()Z

    move-result v13

    if-eqz v13, :cond_c

    add-int/lit8 v14, v14, 0x1

    invoke-virtual {v7, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v13

    if-nez v13, :cond_b

    const/4 v13, 0x0

    goto :goto_8

    :cond_b
    invoke-virtual {v7, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    const/16 v12, 0xe10

    mul-int/2addr v13, v12

    :goto_8
    const/4 v12, 0x2

    invoke-virtual {v7, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    const/16 v17, 0x3c

    mul-int/lit8 v12, v12, 0x3c

    add-int/2addr v13, v12

    const/4 v12, 0x3

    invoke-virtual {v7, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    add-int/2addr v13, v7

    add-int/2addr v15, v13

    :cond_c
    const/4 v12, 0x1

    const/4 v13, 0x2

    goto :goto_7

    .line 125
    :cond_d
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v7

    const/4 v11, 0x1

    if-le v7, v11, :cond_12

    invoke-interface {v5, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v7, "\\s*\u2022\\s*[\\d:]+$"

    invoke-virtual {v5, v7, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v7, ","

    invoke-virtual {v5, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    array-length v7, v5

    const/4 v9, 0x0

    :goto_9
    if-ge v9, v7, :cond_12

    aget-object v11, v5, v9

    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_f

    const-string v12, ".*\\d:\\d\\d.*"

    invoke-virtual {v11, v12}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_f

    invoke-virtual {v6, v11}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_e

    invoke-virtual {v6, v11}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Integer;

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    const/4 v13, 0x1

    add-int/2addr v12, v13

    goto :goto_a

    :cond_e
    const/4 v12, 0x1

    :goto_a
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v6, v11, v12}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_f
    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_10

    const-string v12, ".*\\d:\\d\\d.*"

    invoke-virtual {v11, v12}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_10

    invoke-virtual {v2}, Ljava/util/LinkedHashSet;->size()I

    move-result v12

    const/4 v13, 0x3

    if-ge v12, v13, :cond_11

    invoke-virtual {v2, v11}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto :goto_b

    :cond_10
    const/4 v13, 0x3

    :cond_11
    :goto_b
    add-int/lit8 v9, v9, 0x1

    goto :goto_9

    :cond_12
    const/4 v13, 0x3

    goto :goto_c

    .line 120
    :cond_13
    const/4 v13, 0x3

    :goto_c
    add-int/lit8 v8, v8, 0x1

    move v5, v13

    const/4 v7, -0x2

    const v9, -0x66000001

    const/16 v11, 0xa

    const/4 v12, 0x1

    const/4 v13, 0x2

    goto/16 :goto_6

    .line 127
    :cond_14
    const/4 v5, 0x0

    const/4 v7, 0x0

    :goto_d
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v8

    if-ge v5, v8, :cond_17

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    invoke-static {v11, v8}, Lcom/melodix/music/GlassScreenStyler;->texts(Landroid/view/View;Ljava/util/List;)V

    const-string v11, "Aper\u00e7u Spotify"

    invoke-interface {v8, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_16

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->isClickable()Z

    move-result v7

    if-eqz v7, :cond_15

    add-int/lit8 v10, v10, -0x1

    :cond_15
    const/4 v7, 0x1

    :cond_16
    add-int/lit8 v5, v5, 0x1

    goto :goto_d

    .line 128
    :cond_17
    const-string v5, " titres"

    if-lez v10, :cond_1f

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    if-eqz v7, :cond_18

    const-string v7, "+"

    goto :goto_e

    :cond_18
    move-object v7, v9

    :goto_e
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x1

    if-le v10, v8, :cond_19

    move-object v8, v5

    goto :goto_f

    :cond_19
    const-string v8, " titre"

    :goto_f
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 129
    const/16 v8, 0x3c

    if-lt v15, v8, :cond_1b

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " \u00b7 "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0xe10

    if-lt v15, v8, :cond_1a

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    div-int/lit16 v11, v15, 0xe10

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v11, " h "

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    rem-int/lit16 v11, v15, 0xe10

    const/16 v12, 0x3c

    div-int/2addr v11, v12

    goto :goto_10

    :cond_1a
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    div-int/lit8 v11, v15, 0x3c

    :goto_10
    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v11, " min"

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 130
    :cond_1b
    const/16 v8, 0xd

    const v11, -0x66000001

    const/4 v12, 0x0

    invoke-static {v0, v7, v8, v11, v12}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v7

    const-string v8, "glass-playlist-count"

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 131
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v11, -0x2

    const/4 v12, -0x1

    invoke-direct {v8, v12, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v11, 0x41000000    # 8.0f

    invoke-static {v0, v11}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v11

    iput v11, v8, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v4, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 132
    invoke-virtual {v2}, Ljava/util/LinkedHashSet;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_1f

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Avec "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v8

    const/4 v11, 0x0

    :goto_11
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1d

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    add-int/lit8 v13, v11, 0x1

    if-lez v11, :cond_1c

    const-string v11, ", "

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1c
    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v11, v13

    goto :goto_11

    .line 133
    :cond_1d
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Ljava/util/LinkedHashSet;->size()I

    move-result v2

    if-le v10, v2, :cond_1e

    const-string v2, " et d\'autres"

    goto :goto_12

    :cond_1e
    move-object v2, v9

    :goto_12
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/16 v7, 0xc

    const v8, 0x73ffffff

    const/4 v10, 0x0

    invoke-static {v0, v2, v7, v8, v10}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    const/4 v7, 0x2

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v7, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 134
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x2

    const/4 v10, -0x1

    invoke-direct {v7, v10, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v8, 0x40800000    # 4.0f

    invoke-static {v0, v8}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v8

    iput v8, v7, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v4, v2, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 137
    :cond_1f
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const-string v4, "glass-playlist-stats"

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 138
    invoke-virtual {v6}, Ljava/util/LinkedHashMap;->size()I

    move-result v4

    const/4 v7, 0x1

    if-le v4, v7, :cond_20

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Ljava/util/LinkedHashMap;->size()I

    move-result v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, " artistes"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/melodix/music/GlassScreenStyler;->chip(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 139
    :cond_20
    const/4 v4, 0x1

    if-le v14, v4, :cond_22

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "moy. "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    div-int/2addr v15, v14

    div-int/lit8 v7, v15, 0x3c

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, ":"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v7, 0x3c

    rem-int/2addr v15, v7

    const/16 v7, 0xa

    if-ge v15, v7, :cond_21

    const-string v9, "0"

    :cond_21
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/melodix/music/GlassScreenStyler;->chip(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 140
    :cond_22
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    if-lez v4, :cond_23

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2

    const/4 v8, -0x1

    invoke-direct {v4, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v7, 0x41800000    # 16.0f

    invoke-static {v0, v7}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    iput v7, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v3, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 141
    :cond_23
    invoke-virtual {v6}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v4, 0x0

    move-object v7, v4

    const/4 v6, 0x1

    :cond_24
    :goto_13
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_25

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map$Entry;

    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-le v9, v6, :cond_24

    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    goto :goto_13

    .line 142
    :cond_25
    if-eqz v7, :cond_26

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\u2605  Le plus pr\u00e9sent : "

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v7, " \u00b7 "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/16 v5, 0xc

    const v6, -0x4c000001

    const/4 v7, 0x0

    invoke-static {v0, v2, v5, v6, v7}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 143
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    const/4 v7, -0x1

    invoke-direct {v5, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x41200000    # 10.0f

    invoke-static {v0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v3, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 144
    :cond_26
    new-instance v2, Landroid/view/View;

    invoke-direct {v2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v5, 0x14ffffff

    invoke-virtual {v2, v5}, Landroid/view/View;->setBackgroundColor(I)V

    .line 145
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x3f000000    # 0.5f

    invoke-static {v0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    const/4 v7, 0x1

    invoke-static {v7, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    const/4 v8, -0x1

    invoke-direct {v5, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x41a00000    # 20.0f

    invoke-static {v0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v3, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 146
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    invoke-direct {v2, v8, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v5, 0x0

    invoke-virtual {v1, v3, v5, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 148
    move v12, v7

    :goto_14
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-ge v12, v2, :cond_28

    invoke-virtual {v1, v12}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->isClickable()Z

    move-result v3

    if-nez v3, :cond_27

    const/16 v3, 0xa

    const/4 v5, -0x1

    const/4 v6, 0x0

    const v9, 0x1fffffff

    goto :goto_15

    .line 149
    :cond_27
    const/16 v3, 0xa

    const/4 v5, -0x1

    const/4 v6, 0x0

    invoke-static {v0, v5, v5, v3, v6}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    .line 150
    new-instance v8, Landroid/graphics/drawable/RippleDrawable;

    const v9, 0x1fffffff

    invoke-static {v9}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v10

    invoke-direct {v8, v10, v4, v7}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v2, v8}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 151
    invoke-static {v0, v2}, Lcom/melodix/music/GlassScreenStyler;->track(Landroid/content/Context;Landroid/view/View;)V

    .line 148
    :goto_15
    add-int/lit8 v12, v12, 0x1

    goto :goto_14

    .line 152
    :cond_28
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

    .line 74
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    .line 75
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    .line 77
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 78
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lez v1, :cond_1

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->removeViewAt(I)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_0

    .line 79
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

    .line 285
    invoke-static {p1}, Lcom/melodix/music/GlassScreenStyler;->rowContainer(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object p1

    .line 286
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    const/4 v3, 0x1

    if-ge v1, v2, :cond_2

    .line 287
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 288
    instance-of v4, v2, Landroid/widget/TextView;

    if-eqz v4, :cond_0

    .line 289
    check-cast v2, Landroid/widget/TextView;

    const/high16 v4, 0x41600000    # 14.0f

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextSize(F)V

    const v4, -0x324901

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    sget-object v4, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v2, v4, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 290
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

    .line 291
    goto :goto_1

    :cond_0
    instance-of v3, v2, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_1

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-static {p0, v2}, Lcom/melodix/music/GlassScreenStyler;->styleSettingRow(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    .line 286
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 293
    :cond_2
    invoke-static {p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    .line 294
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

    .line 295
    const v2, -0x29dee5d0

    const v4, 0x50ffffff

    const v5, -0x17a4c980

    const/16 v6, 0x16

    invoke-static {p0, v5, v2, v6, v4}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 296
    const/16 v2, 0xa

    const v4, -0x1a2a01

    const-string v5, "MELODIX  \u2022  VOTRE ESPACE"

    invoke-static {p0, v5, v2, v4, v3}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    const v4, 0x3df5c28f    # 0.12f

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setLetterSpacing(F)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 297
    const-string v2, "Votre musique,\n\u00e0 votre fa\u00e7on."

    const v4, -0x70a01

    invoke-static {p0, v2, v6, v4, v3}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    .line 298
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x40e00000    # 7.0f

    invoke-static {p0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 299
    const/16 v2, 0xc

    const v3, -0x26331b

    const-string v6, "Personnalisez votre exp\u00e9rience."

    invoke-static {p0, v6, v2, v3, v0}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    .line 300
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x40c00000    # 6.0f

    invoke-static {p0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    iput v7, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 301
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result p0

    iput p0, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 302
    invoke-virtual {p1, v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 303
    return-void
.end method

.method public static style(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 65
    if-eqz p0, :cond_6

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
    const-string v0, "home"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p0, p1}, Lcom/melodix/music/GlassScreenStyler;->home(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    goto :goto_0

    .line 68
    :cond_2
    const-string v0, "library"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {p0, p1}, Lcom/melodix/music/GlassScreenStyler;->library(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    goto :goto_0

    .line 69
    :cond_3
    const-string v0, "detail"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-static {p3}, Lcom/melodix/music/GlassScreenStyler;->playlist(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-static {p0, p1, p3, p4}, Lcom/melodix/music/GlassScreenStyler;->playlist(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 70
    :cond_4
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-static {p3}, Lcom/melodix/music/GlassScreenStyler;->liked(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-static {p0, p1, p3, p4}, Lcom/melodix/music/GlassScreenStyler;->playlist(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    :cond_5
    :goto_0
    invoke-static {p0, p1, p2, p3}, Lcom/melodix/music/GlassLikedMotion;->bind(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    return-void

    .line 65
    :cond_6
    :goto_1
    return-void
.end method

.method private static styleSettingRow(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .locals 13

    .line 305
    nop

    .line 306
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

    .line 307
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 308
    instance-of v8, v6, Landroid/widget/ImageView;

    if-eqz v8, :cond_0

    move v4, v7

    goto :goto_1

    .line 309
    :cond_0
    instance-of v7, v6, Landroid/widget/LinearLayout;

    if-eqz v7, :cond_1

    move-object v3, v6

    check-cast v3, Landroid/widget/LinearLayout;

    goto :goto_1

    .line 310
    :cond_1
    instance-of v7, v6, Landroid/widget/TextView;

    if-eqz v7, :cond_2

    move-object v5, v6

    check-cast v5, Landroid/widget/TextView;

    .line 306
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 312
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

    .line 313
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

    .line 314
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

    .line 315
    invoke-virtual {v3, v9}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextSize(F)V

    const v11, -0x424b36

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v11, 0x3

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 314
    :cond_5
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 317
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

    .line 318
    const v3, -0x2ae4e8da

    const/16 v9, 0x14

    const v10, -0x37c7d3b7

    const v12, 0x30ffffff

    invoke-static {p0, v10, v3, v9, v12}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    .line 319
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

    .line 320
    if-nez v4, :cond_8

    .line 321
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

    .line 322
    const v2, -0x779cbc7e

    const/16 v3, 0xc

    const v4, -0x557fa856

    invoke-static {p0, v4, v2, v3, v12}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 323
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    .line 324
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

    .line 326
    :cond_8
    if-eqz v5, :cond_e

    .line 327
    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "ON"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    .line 328
    const-string v2, "Indisponible"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    .line 329
    if-eqz v1, :cond_9

    const v2, -0x57920e

    goto :goto_3

    :cond_9
    if-eqz v0, :cond_a

    const v2, 0x664a4253

    goto :goto_3

    :cond_a
    const v2, -0x7792a284

    .line 330
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

    .line 331
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

    .line 332
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

    .line 333
    const/high16 v0, 0x42e00000    # 112.0f

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v0

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setMaxWidth(I)V

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 335
    :cond_e
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 336
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v1, :cond_f

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {p0, v1}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result p0

    iput p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 337
    :cond_f
    return-void

    .line 312
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

.method private static textViews(Landroid/view/View;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "Landroid/widget/TextView;",
            ">;)V"
        }
    .end annotation

    .line 249
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/widget/TextView;

    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    .line 250
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/melodix/music/GlassScreenStyler;->textViews(Landroid/view/View;Ljava/util/List;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 251
    :cond_1
    return-void
.end method

.method private static texts(Landroid/view/View;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 174
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 175
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/melodix/music/GlassScreenStyler;->texts(Landroid/view/View;Ljava/util/List;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 176
    :cond_1
    :goto_1
    return-void
.end method

.method private static tint(Landroid/widget/LinearLayout;Landroid/widget/ImageView;I)V
    .locals 17

    .line 261
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    const/16 v3, 0x1e

    if-le v2, v3, :cond_0

    return-void

    .line 262
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 263
    instance-of v4, v3, Landroid/graphics/drawable/BitmapDrawable;

    const/4 v5, 0x1

    if-eqz v4, :cond_4

    check-cast v3, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v4

    if-nez v4, :cond_1

    move-object v3, v0

    goto/16 :goto_3

    .line 266
    :cond_1
    invoke-virtual {v3}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    .line 268
    const/16 v2, 0x8

    :try_start_0
    invoke-static {v1, v2, v2, v5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 269
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

    .line 270
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

    .line 271
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

    .line 272
    :catch_0
    move-exception v0

    :goto_2
    nop

    .line 273
    return-void

    .line 263
    :cond_4
    move-object v3, v0

    .line 264
    :goto_3
    new-instance v0, Lcom/melodix/music/GlassScreenStyler;

    const/4 v4, 0x1

    add-int/2addr v2, v4

    invoke-direct {v0, v3, v1, v2}, Lcom/melodix/music/GlassScreenStyler;-><init>(Landroid/widget/LinearLayout;Landroid/widget/ImageView;I)V

    const-wide/16 v2, 0x96

    invoke-virtual {v1, v0, v2, v3}, Landroid/widget/ImageView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private static track(Landroid/content/Context;Landroid/view/View;)V
    .locals 7

    .line 155
    instance-of v0, p1, Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    return-void

    :cond_0
    check-cast p1, Landroid/widget/LinearLayout;

    .line 156
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_6

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/ImageView;

    if-eqz v2, :cond_6

    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    instance-of v3, v3, Landroid/view/ViewGroup;

    if-nez v3, :cond_1

    goto/16 :goto_1

    .line 157
    :cond_1
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    .line 158
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-lt v4, v1, :cond_5

    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    instance-of v4, v4, Landroid/widget/TextView;

    if-eqz v4, :cond_5

    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    instance-of v4, v4, Landroid/widget/TextView;

    if-nez v4, :cond_2

    goto :goto_0

    .line 159
    :cond_2
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 160
    const-string v5, "sans-serif-medium"

    invoke-static {v5, v0}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v4, v5, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    const v4, -0x66000001

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 161
    const-string v4, "glass-row-duration"

    invoke-virtual {p1, v4}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_3

    return-void

    .line 162
    :cond_3
    const-string v5, "^(.*?)\\s*\u2022\\s*(\\d+(?::\\d{2}){1,2})$"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v5

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    .line 163
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v6

    if-nez v6, :cond_4

    return-void

    .line 164
    :cond_4
    invoke-virtual {v5, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 165
    invoke-virtual {v5, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xd

    const v5, -0x7f000001

    invoke-static {p0, v2, v3, v5, v0}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    const/high16 v3, 0x41400000    # 12.0f

    invoke-static {p0, v3}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v3

    const/high16 v4, 0x40800000    # 4.0f

    invoke-static {p0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result p0

    invoke-virtual {v2, v3, v0, p0, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 166
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    .line 167
    const/16 p0, 0x11

    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setGravity(I)V

    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x2

    const/4 v1, -0x1

    invoke-direct {p0, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v2, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 168
    return-void

    .line 158
    :cond_5
    :goto_0
    return-void

    .line 156
    :cond_6
    :goto_1
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

    .line 180
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
