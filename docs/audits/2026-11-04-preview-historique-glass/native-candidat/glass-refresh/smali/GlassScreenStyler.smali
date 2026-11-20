.class public final Lcom/melodix/music/GlassScreenStyler;
.super Ljava/lang/Object;
.source "GlassScreenStyler.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# static fields
.field private static final DISCOVER:Ljava/lang/String; = "\u00c0 d\u00e9couvrir sur Spotify"

.field private static final HOME_FILE:Ljava/lang/String; = "preview_home_cache.json"

.field private static final LIB:Ljava/lang/String; = "Votre biblioth\u00e8que"

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

.field private static lastScreen:Ljava/lang/String;

.field private static savedHome:Ljava/lang/String;

.field private static final scrolls:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final watched:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final scrollTo:I

.field private final scroller:Landroid/widget/ScrollView;

.field private final waitHero:Landroid/widget/LinearLayout;

.field private final waitImage:Landroid/widget/ImageView;

.field private final waitTries:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/melodix/music/GlassScreenStyler;->artwork:Ljava/util/WeakHashMap;

    .line 205
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/melodix/music/GlassScreenStyler;->watched:Ljava/util/WeakHashMap;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/melodix/music/GlassScreenStyler;->scrolls:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Landroid/widget/LinearLayout;Landroid/widget/ImageView;I)V
    .locals 0

    .line 191
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/melodix/music/GlassScreenStyler;->waitHero:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lcom/melodix/music/GlassScreenStyler;->waitImage:Landroid/widget/ImageView;

    iput p3, p0, Lcom/melodix/music/GlassScreenStyler;->waitTries:I

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/melodix/music/GlassScreenStyler;->scroller:Landroid/widget/ScrollView;

    const/4 p1, 0x0

    iput p1, p0, Lcom/melodix/music/GlassScreenStyler;->scrollTo:I

    return-void
.end method

.method private constructor <init>(Landroid/widget/ScrollView;I)V
    .locals 1

    .line 204
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/melodix/music/GlassScreenStyler;->waitHero:Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/melodix/music/GlassScreenStyler;->waitImage:Landroid/widget/ImageView;

    const/4 v0, 0x0

    iput v0, p0, Lcom/melodix/music/GlassScreenStyler;->waitTries:I

    iput-object p1, p0, Lcom/melodix/music/GlassScreenStyler;->scroller:Landroid/widget/ScrollView;

    iput p2, p0, Lcom/melodix/music/GlassScreenStyler;->scrollTo:I

    return-void
.end method

.method private static cards(Landroid/view/View;)Landroid/widget/LinearLayout;
    .locals 3

    .line 309
    instance-of v0, p0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    instance-of v0, p0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    check-cast p0, Landroid/view/ViewGroup;

    .line 310
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

    .line 309
    :cond_2
    :goto_0
    return-object v1
.end method

.method private static chip(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;
    .locals 4

    .line 182
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

    .line 183
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

    .line 314
    instance-of v0, p1, Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    return-void

    :cond_0
    check-cast p1, Landroid/widget/LinearLayout;

    .line 315
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0x10

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 316
    const v1, 0x14ffffff

    const/4 v2, 0x6

    const v3, 0x1fffffff

    invoke-static {p0, v3, v1, v2, v0}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setClipToOutline(Z)V

    .line 317
    move v2, v0

    :goto_0
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_4

    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 318
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

    .line 319
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

    .line 320
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v3, v4}, Lcom/melodix/music/GlassScreenStyler;->textViews(Landroid/view/View;Ljava/util/List;)V

    .line 321
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

    .line 317
    :cond_3
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 322
    :cond_4
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

.method private static eyebrow(Landroid/widget/TextView;)V
    .locals 2

    .line 328
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/high16 v0, 0x41400000    # 12.0f

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

.method public static forgetHome(Landroid/app/Activity;)V
    .locals 2

    .line 278
    const/4 v0, 0x0

    sput-object v0, Lcom/melodix/music/GlassScreenStyler;->savedHome:Ljava/lang/String;

    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object p0

    const-string v1, "preview_home_cache.json"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    :goto_0
    return-void
.end method

.method public static genreQuery(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 232
    if-nez p0, :cond_0

    const-string p0, ""

    return-object p0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 233
    const-string v1, "pop"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "latino"

    if-nez v1, :cond_2

    const-string v1, "rock"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "hip-hop"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 234
    :cond_1
    return-object p0

    .line 233
    :cond_2
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "genre:\""

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v0, "latin"

    :cond_3
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "\""

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
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

.method private static glow(Landroid/content/Context;I)Landroid/graphics/drawable/GradientDrawable;
    .locals 4

    .line 331
    const v0, 0xffffff

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    and-int/2addr v0, p1

    .line 332
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

    .line 333
    const/high16 p1, 0x41a00000    # 20.0f

    invoke-static {p0, p1}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {v1, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v1
.end method

.method private static glyph(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 351
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 352
    const-string v0, "compte"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_9

    const-string v0, "profil"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_3

    .line 353
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

    .line 354
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

    .line 355
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

    .line 356
    :cond_3
    const-string v0, "d\u00e9connexion"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string p0, "\u2197"

    return-object p0

    .line 357
    :cond_4
    const-string v0, "melodix"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_5

    const-string p0, "M"

    return-object p0

    .line 358
    :cond_5
    const-string p0, "\u2726"

    return-object p0

    .line 355
    :cond_6
    :goto_0
    const-string p0, "\u25a6"

    return-object p0

    .line 354
    :cond_7
    :goto_1
    const-string p0, "\u25b6"

    return-object p0

    .line 353
    :cond_8
    :goto_2
    const-string p0, "\u266b"

    return-object p0

    .line 352
    :cond_9
    :goto_3
    const-string p0, "\u25c9"

    return-object p0
.end method

.method private static heading(Landroid/widget/TextView;)V
    .locals 2

    .line 329
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

    .line 283
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static/range {p0 .. p0}, Lcom/melodix/music/GlassScreenStyler;->saveHome(Landroid/app/Activity;)V

    .line 284
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

    .line 285
    :cond_0
    const-string v2, "glass-home-head"

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_1

    return-void

    .line 286
    :cond_1
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 287
    const-string v7, ""

    move v8, v3

    const/4 v9, 0x0

    :goto_0
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v10

    if-ge v8, v10, :cond_6

    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    .line 288
    instance-of v11, v10, Landroid/widget/TextView;

    const-string v12, "Votre biblioth\u00e8que"

    if-eqz v11, :cond_4

    move-object v11, v10

    check-cast v11, Landroid/widget/TextView;

    invoke-virtual {v11}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    .line 289
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

    .line 290
    :goto_2
    invoke-virtual {v12, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    if-nez v9, :cond_5

    invoke-interface {v5, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 291
    :cond_4
    invoke-virtual {v12, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    if-nez v9, :cond_5

    invoke-static {v10}, Lcom/melodix/music/GlassScreenStyler;->cards(Landroid/view/View;)Landroid/widget/LinearLayout;

    move-result-object v9

    if-eqz v9, :cond_5

    invoke-interface {v5, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 287
    :cond_5
    :goto_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 292
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

    move-result v11

    const/high16 v12, 0x41000000    # 8.0f

    invoke-static {v0, v12}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v13

    invoke-virtual {v7, v8, v10, v11, v13}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 293
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v8

    const/16 v10, 0xb

    invoke-virtual {v8, v10}, Ljava/util/Calendar;->get(I)I

    move-result v8

    .line 294
    const/4 v10, 0x5

    const/16 v11, 0xc

    if-lt v8, v10, :cond_7

    if-ge v8, v11, :cond_7

    const-string v8, "Bonjour"

    goto :goto_4

    :cond_7
    if-lt v8, v11, :cond_8

    const/16 v10, 0x12

    if-ge v8, v10, :cond_8

    const-string v8, "Bon apr\u00e8s-midi"

    goto :goto_4

    :cond_8
    const-string v8, "Bonsoir"

    :goto_4
    const/16 v10, 0x1a

    const v11, -0x50506

    invoke-static {v0, v8, v10, v11, v4}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 296
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 297
    const/16 v10, 0x8

    if-eqz v9, :cond_a

    move v11, v3

    :goto_5
    invoke-virtual {v9}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v13

    if-ge v11, v13, :cond_a

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v13

    if-ge v13, v10, :cond_a

    invoke-virtual {v9, v11}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    invoke-virtual {v13}, Landroid/view/View;->isClickable()Z

    move-result v13

    if-eqz v13, :cond_9

    invoke-virtual {v9, v11}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    invoke-interface {v8, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_9
    add-int/lit8 v11, v11, 0x1

    goto :goto_5

    .line 298
    :cond_a
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v11

    const/4 v13, -0x2

    const/4 v14, -0x1

    const/4 v15, 0x2

    if-lt v11, v15, :cond_f

    invoke-static/range {p0 .. p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v11

    const-string v6, "glass-home-quick"

    invoke-virtual {v11, v6}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 299
    move v10, v3

    const/4 v6, 0x0

    :goto_6
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v2

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v15, 0x42600000    # 56.0f

    if-ge v10, v2, :cond_d

    invoke-interface {v8, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-virtual {v9, v2}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 300
    rem-int/lit8 v16, v10, 0x2

    if-nez v16, :cond_b

    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v14, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {v0, v12}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v13

    iput v13, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v11, v6, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 301
    :cond_b
    invoke-static {v0, v2}, Lcom/melodix/music/GlassScreenStyler;->compact(Landroid/content/Context;Landroid/view/View;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v0, v15}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v13

    const/4 v15, 0x0

    invoke-direct {v3, v15, v13, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    if-nez v16, :cond_c

    invoke-static {v0, v12}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    :cond_c
    invoke-virtual {v6, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 299
    add-int/lit8 v10, v10, 0x1

    const/high16 v2, 0x41800000    # 16.0f

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v13, -0x2

    const/4 v15, 0x2

    goto :goto_6

    .line 302
    :cond_d
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x2

    rem-int/2addr v2, v3

    const/4 v3, 0x1

    if-ne v2, v3, :cond_e

    new-instance v2, Landroid/view/View;

    invoke-direct {v2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v0, v15}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v8

    const/4 v10, 0x0

    invoke-direct {v3, v10, v8, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v6, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 303
    :cond_e
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v14, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v3, 0x41800000    # 16.0f

    invoke-static {v0, v3}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v0

    iput v0, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v7, v11, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 304
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

    .line 305
    :cond_f
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v0, v14, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v2, 0x0

    invoke-virtual {v1, v7, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 306
    return-void
.end method

.method private static homeJson(Landroid/app/Activity;)Ljava/lang/String;
    .locals 3

    .line 261
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "nativeHomeJson"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_0

    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, p0

    :cond_0
    return-object v0

    .line 262
    :catchall_0
    move-exception p0

    return-object v0
.end method

.method private static keepScroll(Landroid/view/View;Ljava/lang/String;)V
    .locals 3

    .line 207
    :goto_0
    if-eqz p0, :cond_1

    instance-of v0, p0, Landroid/widget/ScrollView;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_0

    .line 208
    :cond_1
    if-eqz p0, :cond_9

    sget-object v0, Lcom/melodix/music/GlassScreenStyler;->lastScreen:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto/16 :goto_3

    :cond_2
    check-cast p0, Landroid/widget/ScrollView;

    .line 211
    sget-object v0, Lcom/melodix/music/GlassScreenStyler;->watched:Ljava/util/WeakHashMap;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_3

    invoke-virtual {p0}, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/melodix/music/GlassScreenStyler;

    const/4 v2, -0x1

    invoke-direct {v1, p0, v2}, Lcom/melodix/music/GlassScreenStyler;-><init>(Landroid/widget/ScrollView;I)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 212
    :cond_3
    sget-object v0, Lcom/melodix/music/GlassScreenStyler;->lastScreen:Ljava/lang/String;

    if-eqz v0, :cond_5

    sget-object v0, Lcom/melodix/music/GlassScreenStyler;->scrolls:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    const/16 v1, 0x20

    if-lt v0, v1, :cond_4

    sget-object v0, Lcom/melodix/music/GlassScreenStyler;->scrolls:Ljava/util/Map;

    sget-object v1, Lcom/melodix/music/GlassScreenStyler;->lastScreen:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    sget-object v0, Lcom/melodix/music/GlassScreenStyler;->scrolls:Ljava/util/Map;

    sget-object v1, Lcom/melodix/music/GlassScreenStyler;->scrolls:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    sget-object v0, Lcom/melodix/music/GlassScreenStyler;->scrolls:Ljava/util/Map;

    sget-object v1, Lcom/melodix/music/GlassScreenStyler;->lastScreen:Ljava/lang/String;

    invoke-virtual {p0}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    :cond_5
    sput-object p1, Lcom/melodix/music/GlassScreenStyler;->lastScreen:Ljava/lang/String;

    .line 215
    const-string v0, "detail:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_7

    sget-object v0, Lcom/melodix/music/GlassScreenStyler;->scrolls:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    goto :goto_1

    :cond_6
    sget-object v0, Lcom/melodix/music/GlassScreenStyler;->scrolls:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    goto :goto_2

    :cond_7
    :goto_1
    move p1, v1

    .line 216
    :goto_2
    invoke-virtual {p0, v1, v1}, Landroid/widget/ScrollView;->scrollTo(II)V

    if-lez p1, :cond_8

    new-instance v0, Lcom/melodix/music/GlassScreenStyler;

    invoke-direct {v0, p0, p1}, Lcom/melodix/music/GlassScreenStyler;-><init>(Landroid/widget/ScrollView;I)V

    invoke-virtual {p0, v0}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    .line 217
    :cond_8
    return-void

    .line 208
    :cond_9
    :goto_3
    return-void
.end method

.method private static library(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .locals 11

    .line 242
    invoke-static {p1}, Lcom/melodix/music/GlassScreenStyler;->rowContainer(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object p1

    .line 243
    const-string v0, "glass-library-head"

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    return-void

    .line 244
    :cond_0
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 245
    const/4 v2, 0x0

    move v3, v2

    move v4, v3

    :goto_0
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v5

    const/4 v6, 0x1

    if-ge v3, v5, :cond_4

    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 246
    invoke-static {p0, v5}, Lcom/melodix/music/GlassScreenStyler;->listRow(Landroid/app/Activity;Landroid/view/View;)Z

    move-result v7

    if-nez v7, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 248
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v5, v7}, Lcom/melodix/music/GlassScreenStyler;->texts(Landroid/view/View;Ljava/util/List;)V

    .line 249
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v5

    if-le v5, v6, :cond_3

    invoke-interface {v7, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v7, "[\u2022\u00b7]"

    invoke-virtual {v5, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    aget-object v5, v5, v2

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    const-string v7, "(?i)playlists?|albums?|artistes?|podcasts?|titres?"

    invoke-virtual {v5, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-virtual {v1, v5}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-virtual {v1, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/2addr v6, v7

    :cond_2
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    :cond_3
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 250
    :cond_4
    invoke-static {p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const/high16 v0, 0x41800000    # 16.0f

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    const/high16 v7, 0x41000000    # 8.0f

    invoke-static {p0, v7}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v0

    const/high16 v8, 0x41400000    # 12.0f

    invoke-static {p0, v8}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v8

    invoke-virtual {v3, v5, v7, v0, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 251
    const/16 v0, 0x1c

    const v5, -0x50506

    const-string v7, "Ta biblioth\u00e8que"

    invoke-static {p0, v7, v0, v5, v6}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 252
    new-instance v0, Ljava/lang/StringBuilder;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    if-le v4, v6, :cond_5

    const-string v7, " \u00e9l\u00e9ments"

    goto :goto_2

    :cond_5
    const-string v7, " \u00e9l\u00e9ment"

    :goto_2
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 253
    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    sget-object v8, Ljava/util/Locale;->FRENCH:Ljava/util/Locale;

    invoke-virtual {v7, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "s$"

    const-string v9, ""

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, " \u00b7 "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v10, 0x20

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-le v5, v6, :cond_6

    const-string v9, "s"

    :cond_6
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 254
    :cond_7
    const/4 v1, -0x2

    const/4 v5, -0x1

    if-lez v4, :cond_8

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v4, 0xd

    const v6, -0x66000001

    invoke-static {p0, v0, v4, v6, v2}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v0

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v5, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x40800000    # 4.0f

    invoke-static {p0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result p0

    iput p0, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v3, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 255
    :cond_8
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v5, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v3, v2, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 256
    return-void
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

.method private static listRow(Landroid/app/Activity;Landroid/view/View;)Z
    .locals 6

    .line 221
    instance-of v0, p1, Landroid/widget/TextView;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    check-cast p1, Landroid/widget/TextView;

    invoke-static {p1}, Lcom/melodix/music/GlassScreenStyler;->heading(Landroid/widget/TextView;)V

    const/high16 p0, 0x41900000    # 18.0f

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextSize(F)V

    return v1

    .line 222
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->isClickable()Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    .line 223
    :cond_1
    const/16 v0, 0xa

    const/4 v2, -0x1

    invoke-static {p0, v2, v2, v0, v1}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    .line 224
    new-instance v2, Landroid/graphics/drawable/RippleDrawable;

    const v3, 0x1fffffff

    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, v0}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1, v2}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 225
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    move-object v0, p1

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-lez v2, :cond_2

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/ImageView;

    if-eqz v2, :cond_2

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/widget/ImageView;

    .line 226
    :cond_2
    const/4 v0, 0x1

    if-eqz v4, :cond_4

    invoke-virtual {v4}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-nez v2, :cond_3

    const v2, -0xe7e7e5

    const/4 v3, 0x6

    const v5, -0xd5d5d2

    invoke-static {p0, v5, v2, v3, v1}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v4, v1}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_3
    invoke-virtual {v4, v0}, Landroid/widget/ImageView;->setClipToOutline(Z)V

    .line 227
    :cond_4
    invoke-static {p0, p1}, Lcom/melodix/music/GlassScreenStyler;->track(Landroid/content/Context;Landroid/view/View;)V

    return v0
.end method

.method private static playlist(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V
    .locals 21

    .line 83
    move-object/from16 v0, p0

    invoke-static/range {p1 .. p1}, Lcom/melodix/music/GlassScreenStyler;->rowContainer(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v1

    .line 84
    const-string v2, "glass-old-playlist-heading"

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    .line 85
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-ne v3, v1, :cond_0

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 86
    :cond_0
    invoke-static/range {p2 .. p2}, Lcom/melodix/music/GlassScreenStyler;->liked(Ljava/lang/String;)Z

    move-result v2

    .line 87
    invoke-static/range {p0 .. p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v3

    const-string v4, "glass-playlist-hero"

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const/high16 v4, 0x41800000    # 16.0f

    invoke-static {v0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-static {v0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    invoke-static {v0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    const/high16 v8, 0x41c00000    # 24.0f

    invoke-static {v0, v8}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v8

    invoke-virtual {v3, v5, v6, v7, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 89
    const/4 v5, 0x0

    invoke-static {v0, v5}, Lcom/melodix/music/GlassScreenStyler;->glow(Landroid/content/Context;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 91
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v7, 0x11

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 92
    new-instance v8, Landroid/widget/ImageView;

    invoke-direct {v8, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v9, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 93
    const v9, 0x1fffffff

    const v10, 0xfffffff

    const/16 v11, 0xa

    invoke-static {v0, v9, v10, v11, v5}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v12

    invoke-virtual {v8, v12}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 94
    const/4 v12, 0x1

    invoke-virtual {v8, v12}, Landroid/widget/ImageView;->setClipToOutline(Z)V

    const/4 v13, 0x2

    invoke-virtual {v8, v13}, Landroid/widget/ImageView;->setImportantForAccessibility(I)V

    .line 95
    move-object/from16 v14, p2

    invoke-static {v0, v14}, Lcom/melodix/music/GlassScreenStyler;->selectedArtwork(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 96
    invoke-static/range {p0 .. p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v15

    invoke-virtual {v15, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 97
    if-eqz v2, :cond_1

    const v10, -0xd5d5d2

    const v4, -0xeeeeed

    invoke-static {v0, v10, v4, v11, v9}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v4

    goto :goto_0

    :cond_1
    invoke-static {v0, v9, v10, v11, v9}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v4

    :goto_0
    invoke-virtual {v15, v4}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v15, v12}, Landroid/widget/LinearLayout;->setClipToOutline(Z)V

    const/high16 v4, 0x41200000    # 10.0f

    invoke-static {v0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {v15, v10}, Landroid/widget/LinearLayout;->setElevation(F)V

    .line 98
    const-string v10, "PLAYLIST"

    const v9, -0x66000001

    const/16 v4, 0xc

    const/4 v11, -0x1

    if-eqz v14, :cond_2

    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v16

    if-nez v16, :cond_2

    .line 99
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v11, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v15, v8, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    const/high16 v7, 0x43700000    # 240.0f

    invoke-static {v0, v7}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-static {v8, v14, v7}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V

    invoke-static {v3, v8, v5}, Lcom/melodix/music/GlassScreenStyler;->tint(Landroid/widget/LinearLayout;Landroid/widget/ImageView;I)V

    goto :goto_3

    .line 104
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
    xor-int/lit8 v11, v2, 0x1

    const v5, -0x70a01

    invoke-static {v0, v8, v14, v5, v11}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 105
    invoke-virtual {v5, v13}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    invoke-virtual {v15, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 106
    if-nez v2, :cond_5

    .line 107
    invoke-static {v0, v10, v4, v9, v12}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v5

    const v8, 0x3e23d70a    # 0.16f

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setLetterSpacing(F)V

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 108
    invoke-virtual {v5, v13}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    invoke-virtual {v15, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 111
    :cond_5
    :goto_3
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x430c0000    # 140.0f

    invoke-static {v0, v7}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v8

    invoke-static {v0, v7}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-direct {v5, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v15, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 112
    invoke-static/range {p0 .. p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v5

    const/high16 v7, 0x41800000    # 16.0f

    invoke-static {v0, v7}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v8

    const/4 v7, 0x0

    invoke-virtual {v5, v8, v7, v7, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x2

    const/4 v11, -0x1

    invoke-direct {v7, v11, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v5, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 113
    if-eqz v2, :cond_6

    const-string v10, "VOTRE BIBLIOTH\u00c8QUE"

    :cond_6
    const/4 v6, 0x0

    invoke-static {v0, v10, v4, v9, v6}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v7

    const-string v10, "sans-serif-medium"

    invoke-static {v10, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v11

    invoke-virtual {v7, v11, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    const v6, 0x3df5c28f    # 0.12f

    invoke-virtual {v7, v6}, Landroid/widget/TextView;->setLetterSpacing(F)V

    .line 114
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v11, -0x1

    invoke-direct {v6, v11, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v7, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 115
    if-eqz p3, :cond_8

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_7

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
    const/16 v6, 0x1a

    const v7, -0x50506

    const/4 v11, 0x0

    invoke-static {v0, v2, v6, v7, v11}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    .line 116
    invoke-static {v10, v11}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v6

    invoke-virtual {v2, v6, v11}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    const v6, -0x43dc28f6    # -0.01f

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setLetterSpacing(F)V

    const/4 v6, 0x0

    const v7, 0x3f866666    # 1.05f

    invoke-virtual {v2, v6, v7}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 117
    const/4 v6, 0x3

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v7, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 118
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v10, -0x1

    invoke-direct {v7, v10, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v10, 0x40c00000    # 6.0f

    invoke-static {v0, v10}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v10

    iput v10, v7, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v5, v2, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 120
    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    new-instance v7, Ljava/util/LinkedHashMap;

    invoke-direct {v7}, Ljava/util/LinkedHashMap;-><init>()V

    .line 121
    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    :goto_6
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    const-string v9, ""

    if-ge v10, v4, :cond_14

    invoke-virtual {v1, v10}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    if-eq v4, v3, :cond_13

    invoke-virtual {v4}, Landroid/view/View;->isClickable()Z

    move-result v17

    if-nez v17, :cond_a

    const/4 v13, 0x3

    goto/16 :goto_c

    :cond_a
    add-int/lit8 v11, v11, 0x1

    .line 122
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v4, v6}, Lcom/melodix/music/GlassScreenStyler;->texts(Landroid/view/View;Ljava/util/List;)V

    .line 123
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_7
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    const-string v19, "(?:^|\u2022 )(?:(\\d+):)?(\\d{1,2}):(\\d{2})$"

    invoke-static/range {v19 .. v19}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v13

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v13, v8}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v8

    .line 124
    invoke-virtual {v8}, Ljava/util/regex/Matcher;->find()Z

    move-result v13

    if-eqz v13, :cond_c

    add-int/lit8 v14, v14, 0x1

    invoke-virtual {v8, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v13

    if-nez v13, :cond_b

    const/4 v13, 0x0

    goto :goto_8

    :cond_b
    invoke-virtual {v8, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    const/16 v12, 0xe10

    mul-int/2addr v13, v12

    :goto_8
    const/4 v12, 0x2

    invoke-virtual {v8, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    const/16 v17, 0x3c

    mul-int/lit8 v12, v12, 0x3c

    add-int/2addr v13, v12

    const/4 v12, 0x3

    invoke-virtual {v8, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    add-int/2addr v13, v8

    add-int/2addr v15, v13

    :cond_c
    const/4 v12, 0x1

    const/4 v13, 0x2

    goto :goto_7

    .line 126
    :cond_d
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v4

    const/4 v8, 0x1

    if-le v4, v8, :cond_12

    invoke-interface {v6, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v6, "\\s*\u2022\\s*[\\d:]+$"

    invoke-virtual {v4, v6, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v6, ","

    invoke-virtual {v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    array-length v6, v4

    const/4 v8, 0x0

    :goto_9
    if-ge v8, v6, :cond_12

    aget-object v9, v4, v8

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_f

    const-string v12, ".*\\d:\\d\\d.*"

    invoke-virtual {v9, v12}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_f

    invoke-virtual {v7, v9}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_e

    invoke-virtual {v7, v9}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

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

    invoke-virtual {v7, v9, v12}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_f
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_10

    const-string v12, ".*\\d:\\d\\d.*"

    invoke-virtual {v9, v12}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_10

    invoke-virtual {v2}, Ljava/util/LinkedHashSet;->size()I

    move-result v12

    const/4 v13, 0x3

    if-ge v12, v13, :cond_11

    invoke-virtual {v2, v9}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto :goto_b

    :cond_10
    const/4 v13, 0x3

    :cond_11
    :goto_b
    add-int/lit8 v8, v8, 0x1

    goto :goto_9

    :cond_12
    const/4 v13, 0x3

    goto :goto_c

    .line 121
    :cond_13
    const/4 v13, 0x3

    :goto_c
    add-int/lit8 v10, v10, 0x1

    move v6, v13

    const/16 v4, 0xc

    const/4 v8, -0x2

    const v9, -0x66000001

    const/4 v12, 0x1

    const/4 v13, 0x2

    goto/16 :goto_6

    .line 128
    :cond_14
    const/4 v4, 0x0

    const/4 v6, 0x0

    :goto_d
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v8

    if-ge v4, v8, :cond_17

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    invoke-static {v10, v8}, Lcom/melodix/music/GlassScreenStyler;->texts(Landroid/view/View;Ljava/util/List;)V

    const-string v10, "Aper\u00e7u Spotify"

    invoke-interface {v8, v10}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_16

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->isClickable()Z

    move-result v6

    if-eqz v6, :cond_15

    add-int/lit8 v11, v11, -0x1

    :cond_15
    const/4 v6, 0x1

    :cond_16
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    .line 129
    :cond_17
    const-string v4, " titres"

    if-lez v11, :cond_1f

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    if-eqz v6, :cond_18

    const-string v6, "+"

    goto :goto_e

    :cond_18
    move-object v6, v9

    :goto_e
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/4 v8, 0x1

    if-le v11, v8, :cond_19

    move-object v8, v4

    goto :goto_f

    :cond_19
    const-string v8, " titre"

    :goto_f
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 130
    const/16 v8, 0x3c

    if-lt v15, v8, :cond_1b

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, " \u00b7 "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v8, 0xe10

    if-lt v15, v8, :cond_1a

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    div-int/lit16 v10, v15, 0xe10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, " h "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    rem-int/lit16 v10, v15, 0xe10

    const/16 v12, 0x3c

    div-int/2addr v10, v12

    goto :goto_10

    :cond_1a
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    div-int/lit8 v10, v15, 0x3c

    :goto_10
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, " min"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 131
    :cond_1b
    const/16 v8, 0xd

    const v10, -0x66000001

    const/4 v12, 0x0

    invoke-static {v0, v6, v8, v10, v12}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v6

    const-string v8, "glass-playlist-count"

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 132
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v10, -0x2

    const/4 v12, -0x1

    invoke-direct {v8, v12, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v10, 0x41000000    # 8.0f

    invoke-static {v0, v10}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v10

    iput v10, v8, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v5, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 133
    invoke-virtual {v2}, Ljava/util/LinkedHashSet;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1f

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v8, "Avec "

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v8

    const/4 v10, 0x0

    :goto_11
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1d

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    add-int/lit8 v13, v10, 0x1

    if-lez v10, :cond_1c

    const-string v10, ", "

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1c
    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v10, v13

    goto :goto_11

    .line 134
    :cond_1d
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Ljava/util/LinkedHashSet;->size()I

    move-result v2

    if-le v11, v2, :cond_1e

    const-string v2, " et d\'autres"

    goto :goto_12

    :cond_1e
    move-object v2, v9

    :goto_12
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const v6, -0x66000001

    const/16 v8, 0xc

    const/4 v10, 0x0

    invoke-static {v0, v2, v8, v6, v10}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    const/4 v6, 0x2

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 135
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x2

    const/4 v10, -0x1

    invoke-direct {v6, v10, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v8, 0x40800000    # 4.0f

    invoke-static {v0, v8}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v8

    iput v8, v6, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v5, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 138
    :cond_1f
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const-string v5, "glass-playlist-stats"

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 139
    invoke-virtual {v7}, Ljava/util/LinkedHashMap;->size()I

    move-result v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_20

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7}, Ljava/util/LinkedHashMap;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " artistes"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/melodix/music/GlassScreenStyler;->chip(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 140
    :cond_20
    const/4 v5, 0x1

    if-le v14, v5, :cond_22

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "moy. "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    div-int/2addr v15, v14

    div-int/lit8 v6, v15, 0x3c

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x3c

    rem-int/2addr v15, v6

    const/16 v6, 0xa

    if-ge v15, v6, :cond_21

    const-string v9, "0"

    :cond_21
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/melodix/music/GlassScreenStyler;->chip(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 141
    :cond_22
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v5

    if-lez v5, :cond_23

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    const/4 v8, -0x1

    invoke-direct {v5, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x41800000    # 16.0f

    invoke-static {v0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v3, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 142
    :cond_23
    invoke-virtual {v7}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v5, 0x0

    move-object v7, v5

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

    .line 143
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

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const v4, -0x4c000001

    const/16 v6, 0xc

    const/4 v7, 0x0

    invoke-static {v0, v2, v6, v4, v7}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 144
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    const/4 v7, -0x1

    invoke-direct {v4, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x41200000    # 10.0f

    invoke-static {v0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    iput v6, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v3, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 145
    :cond_26
    new-instance v2, Landroid/view/View;

    invoke-direct {v2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v4, 0x14ffffff

    invoke-virtual {v2, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 146
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x3f000000    # 0.5f

    invoke-static {v0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    const/4 v7, 0x1

    invoke-static {v7, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    const/4 v8, -0x1

    invoke-direct {v4, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x41a00000    # 20.0f

    invoke-static {v0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    iput v6, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v3, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 147
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    invoke-direct {v2, v8, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 149
    move v12, v7

    const/4 v7, 0x0

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

    const/4 v4, -0x1

    const/4 v6, 0x0

    const v10, 0x1fffffff

    goto :goto_15

    .line 150
    :cond_27
    const/16 v3, 0xa

    const/4 v4, -0x1

    const/4 v6, 0x0

    invoke-static {v0, v4, v4, v3, v6}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v8

    .line 151
    new-instance v9, Landroid/graphics/drawable/RippleDrawable;

    const v10, 0x1fffffff

    invoke-static {v10}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v11

    invoke-direct {v9, v11, v5, v8}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v2, v9}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 152
    add-int/lit8 v7, v7, 0x1

    invoke-static {v0, v2, v7}, Lcom/melodix/music/GlassScreenStyler;->track(Landroid/content/Context;Landroid/view/View;I)V

    .line 149
    :goto_15
    add-int/lit8 v12, v12, 0x1

    goto :goto_14

    .line 153
    :cond_28
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

.method public static restoreHome(Landroid/app/Activity;)V
    .locals 6

    .line 271
    if-eqz p0, :cond_5

    invoke-static {p0}, Lcom/melodix/music/GlassScreenStyler;->homeJson(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    goto/16 :goto_4

    .line 272
    :cond_0
    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "preview_home_cache.json"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    const-wide/32 v3, 0x1e8480

    cmp-long v1, v1, v3

    if-lez v1, :cond_1

    goto :goto_2

    .line 273
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    long-to-int v1, v1

    new-array v2, v1, [B

    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v0, 0x0

    move v4, v0

    :goto_0
    if-ge v4, v1, :cond_3

    sub-int v5, v1, v4

    :try_start_1
    invoke-virtual {v3, v2, v4, v5}, Ljava/io/FileInputStream;->read([BII)I

    move-result v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-gez v5, :cond_2

    goto :goto_1

    :cond_2
    add-int/2addr v4, v5

    goto :goto_0

    :catchall_0
    move-exception p0

    :try_start_2
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    throw p0

    :cond_3
    :goto_1
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    .line 274
    new-instance v1, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    sput-object v1, Lcom/melodix/music/GlassScreenStyler;->savedHome:Ljava/lang/String;

    .line 275
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "applyNativeUiData"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    aput-object v5, v4, v0

    const-class v0, Ljava/lang/String;

    const/4 v5, 0x1

    aput-object v0, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const-string v2, "home"

    filled-new-array {v2, v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_3

    .line 272
    :cond_4
    :goto_2
    return-void

    .line 276
    :catchall_1
    move-exception p0

    :goto_3
    nop

    .line 277
    return-void

    .line 271
    :cond_5
    :goto_4
    return-void
.end method

.method private static rowContainer(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;
    .locals 4

    .line 75
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    .line 76
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    .line 78
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 79
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lez v1, :cond_1

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->removeViewAt(I)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_0

    .line 80
    :cond_1
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method private static saveHome(Landroid/app/Activity;)V
    .locals 4

    .line 266
    invoke-static {p0}, Lcom/melodix/music/GlassScreenStyler;->homeJson(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x8

    if-lt v1, v2, :cond_1

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Lcom/melodix/music/GlassScreenStyler;->savedHome:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 267
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object p0

    const-string v3, "preview_home_cache.json"

    invoke-direct {v2, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    const-string p0, "UTF-8"

    invoke-virtual {v0, p0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    sput-object v0, Lcom/melodix/music/GlassScreenStyler;->savedHome:Ljava/lang/String;

    goto :goto_0

    :catchall_0
    move-exception p0

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 268
    :catchall_1
    move-exception p0

    :goto_0
    nop

    .line 269
    return-void

    .line 266
    :cond_1
    :goto_1
    return-void
.end method

.method private static search(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .locals 2

    .line 238
    invoke-static {p1}, Lcom/melodix/music/GlassScreenStyler;->rowContainer(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object p1

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/melodix/music/GlassScreenStyler;->listRow(Landroid/app/Activity;Landroid/view/View;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 239
    :cond_0
    return-void
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

    .line 361
    invoke-static {p1}, Lcom/melodix/music/GlassScreenStyler;->rowContainer(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object p1

    .line 362
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    const/high16 v3, 0x41000000    # 8.0f

    if-ge v1, v2, :cond_2

    .line 363
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 364
    instance-of v4, v2, Landroid/widget/TextView;

    if-eqz v4, :cond_0

    .line 365
    check-cast v2, Landroid/widget/TextView;

    invoke-static {v2}, Lcom/melodix/music/GlassScreenStyler;->eyebrow(Landroid/widget/TextView;)V

    const-string v4, "sans-serif-medium"

    invoke-static {v4, v0}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v2, v4, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 366
    const/high16 v4, 0x40800000    # 4.0f

    invoke-static {p0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    const/high16 v6, 0x41c00000    # 24.0f

    invoke-static {p0, v6}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    invoke-static {p0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v4

    invoke-static {p0, v3}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-virtual {v2, v5, v6, v4, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 367
    goto :goto_1

    :cond_0
    instance-of v3, v2, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_1

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-static {p0, v2}, Lcom/melodix/music/GlassScreenStyler;->styleSettingRow(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    .line 362
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 369
    :cond_2
    invoke-static {p0}, Lcom/melodix/music/GlassScreenStyler;->vertical(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    .line 370
    const/high16 v2, 0x41800000    # 16.0f

    invoke-static {p0, v2}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v4

    invoke-static {p0, v2}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-static {p0, v2}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v6

    invoke-static {p0, v2}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-virtual {v1, v4, v5, v6, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 371
    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->glow(Landroid/content/Context;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 372
    const/16 v2, 0xc

    const v4, -0x73000001

    const-string v5, "MELODIX  \u2022  PARAM\u00c8TRES"

    invoke-static {p0, v5, v2, v4, v0}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    const v4, 0x3e0f5c29    # 0.14f

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setLetterSpacing(F)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 373
    const/16 v2, 0x1a

    const v4, -0x50506

    const-string v5, "Votre musique,\n\u00e0 votre fa\u00e7on."

    const/4 v6, 0x1

    invoke-static {p0, v5, v2, v4, v6}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    .line 374
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p0, v3}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v3

    iput v3, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v1, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 375
    const/16 v2, 0xd

    const v3, -0x66000001

    const-string v4, "Personnalisez votre exp\u00e9rience."

    invoke-static {p0, v4, v2, v3, v0}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v2

    .line 376
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v4, 0x40c00000    # 6.0f

    invoke-static {p0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    iput v7, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 377
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p0, v4}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result p0

    iput p0, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 378
    invoke-virtual {p1, v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 379
    return-void
.end method

.method public static style(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 64
    if-eqz p0, :cond_8

    if-nez p1, :cond_0

    goto/16 :goto_2

    .line 65
    :cond_0
    const-string v0, "detail"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "detail:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-static {p1, v1}, Lcom/melodix/music/GlassScreenStyler;->keepScroll(Landroid/view/View;Ljava/lang/String;)V

    .line 66
    const-string v1, "settings"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {p0, p1}, Lcom/melodix/music/GlassScreenStyler;->settings(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    goto :goto_1

    .line 67
    :cond_2
    const-string v1, "home"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {p0, p1}, Lcom/melodix/music/GlassScreenStyler;->home(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    goto :goto_1

    .line 68
    :cond_3
    const-string v1, "library"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-static {p0, p1}, Lcom/melodix/music/GlassScreenStyler;->library(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    goto :goto_1

    .line 69
    :cond_4
    const-string v1, "search"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-static {p0, p1}, Lcom/melodix/music/GlassScreenStyler;->search(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    goto :goto_1

    .line 70
    :cond_5
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-static {p3}, Lcom/melodix/music/GlassScreenStyler;->playlist(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-static {p0, p1, p3, p4}, Lcom/melodix/music/GlassScreenStyler;->playlist(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 71
    :cond_6
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-static {p3}, Lcom/melodix/music/GlassScreenStyler;->liked(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-static {p0, p1, p3, p4}, Lcom/melodix/music/GlassScreenStyler;->playlist(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    :cond_7
    :goto_1
    invoke-static {p0, p1, p2, p3}, Lcom/melodix/music/GlassLikedMotion;->bind(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    return-void

    .line 64
    :cond_8
    :goto_2
    return-void
.end method

.method private static styleSettingRow(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .locals 14

    .line 381
    nop

    .line 382
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

    .line 383
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 384
    instance-of v8, v6, Landroid/widget/ImageView;

    if-eqz v8, :cond_0

    move v4, v7

    goto :goto_1

    .line 385
    :cond_0
    instance-of v7, v6, Landroid/widget/LinearLayout;

    if-eqz v7, :cond_1

    move-object v3, v6

    check-cast v3, Landroid/widget/LinearLayout;

    goto :goto_1

    .line 386
    :cond_1
    instance-of v7, v6, Landroid/widget/TextView;

    if-eqz v7, :cond_2

    move-object v5, v6

    check-cast v5, Landroid/widget/TextView;

    .line 382
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 388
    :cond_3
    if-eqz v3, :cond_10

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/TextView;

    if-nez v2, :cond_4

    goto/16 :goto_6

    .line 389
    :cond_4
    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    const/high16 v6, 0x41700000    # 15.0f

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setTextSize(F)V

    const v6, -0x50506

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setTextColor(I)V

    const-string v8, "sans-serif-medium"

    invoke-static {v8, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v8

    invoke-virtual {v2, v8, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    const/4 v8, 0x2

    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 390
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

    .line 391
    invoke-virtual {v3, v9}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextSize(F)V

    const v11, -0x73000001

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v11, 0x3

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 390
    :cond_5
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 393
    :cond_6
    const/high16 v3, 0x41800000    # 16.0f

    invoke-static {p0, v3}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v9

    invoke-static {p0, v11}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v10

    invoke-static {p0, v3}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-static {p0, v11}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v12

    invoke-virtual {p1, v9, v10, v3, v12}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/high16 v3, 0x42900000    # 72.0f

    invoke-static {p0, v3}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 394
    const v3, 0xaffffff

    const/16 v9, 0xe

    const v10, 0xfffffff

    const v12, 0x14ffffff

    invoke-static {p0, v10, v3, v9, v12}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    .line 395
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->isClickable()Z

    move-result v9

    const v10, 0x1fffffff

    if-eqz v9, :cond_7

    new-instance v9, Landroid/graphics/drawable/RippleDrawable;

    invoke-static {v10}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v13

    invoke-direct {v9, v13, v3, v0}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    move-object v3, v9

    :cond_7
    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 396
    if-nez v4, :cond_8

    .line 397
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/GlassScreenStyler;->glyph(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x12

    invoke-static {p0, v0, v2, v6, v7}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v0

    const/16 v2, 0x11

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 398
    const/16 v2, 0x14

    invoke-static {p0, v10, v12, v2, v1}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 399
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    .line 400
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

    .line 402
    :cond_8
    const/high16 v0, 0x41000000    # 8.0f

    if-eqz v5, :cond_e

    .line 403
    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "ON"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    .line 404
    const-string v4, "Indisponible"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    .line 406
    if-eqz v3, :cond_9

    goto :goto_3

    :cond_9
    if-eqz v2, :cond_a

    const v6, 0xdffffff

    goto :goto_3

    :cond_a
    const v6, 0x1affffff

    .line 407
    :goto_3
    if-eqz v3, :cond_b

    goto :goto_4

    :cond_b
    move v1, v10

    :goto_4
    const/16 v4, 0x10

    invoke-static {p0, v6, v6, v4, v1}, Lcom/melodix/music/GlassScreenStyler;->glass(Landroid/content/Context;IIII)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    if-eqz v3, :cond_c

    const v1, -0xf5f5f6

    goto :goto_5

    :cond_c
    if-eqz v2, :cond_d

    const v1, 0x66ffffff

    goto :goto_5

    :cond_d
    const v1, -0x19000001

    :goto_5
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 408
    invoke-virtual {v5, v11}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-static {p0, v11}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-static {p0, v11}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v4

    invoke-virtual {v5, v1, v2, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 409
    const/high16 v1, 0x42e00000    # 112.0f

    invoke-static {p0, v1}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setMaxWidth(I)V

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 411
    :cond_e
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 412
    instance-of v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v2, :cond_f

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result p0

    iput p0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 413
    :cond_f
    return-void

    .line 388
    :cond_10
    :goto_6
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

    .line 324
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/widget/TextView;

    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    .line 325
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

    .line 326
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

    .line 186
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

    .line 187
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

    .line 188
    :cond_1
    :goto_1
    return-void
.end method

.method private static tint(Landroid/widget/LinearLayout;Landroid/widget/ImageView;I)V
    .locals 17

    .line 337
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    const/16 v3, 0x1e

    if-le v2, v3, :cond_0

    return-void

    .line 338
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 339
    instance-of v4, v3, Landroid/graphics/drawable/BitmapDrawable;

    const/4 v5, 0x1

    if-eqz v4, :cond_4

    check-cast v3, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v4

    if-nez v4, :cond_1

    move-object v3, v0

    goto/16 :goto_3

    .line 342
    :cond_1
    invoke-virtual {v3}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    .line 344
    const/16 v2, 0x8

    :try_start_0
    invoke-static {v1, v2, v2, v5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 345
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

    .line 346
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

    .line 347
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

    .line 348
    :catch_0
    move-exception v0

    :goto_2
    nop

    .line 349
    return-void

    .line 339
    :cond_4
    move-object v3, v0

    .line 340
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
    .locals 1

    .line 155
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/melodix/music/GlassScreenStyler;->track(Landroid/content/Context;Landroid/view/View;I)V

    return-void
.end method

.method private static track(Landroid/content/Context;Landroid/view/View;I)V
    .locals 13

    .line 157
    instance-of v0, p1, Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    return-void

    :cond_0
    check-cast p1, Landroid/widget/LinearLayout;

    .line 159
    const-string v0, "glass-row-number"

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    .line 160
    const/4 v2, -0x1

    const/16 v3, 0x11

    const v4, -0x66000001

    const/4 v5, 0x2

    const/4 v6, 0x0

    if-lez p2, :cond_1

    instance-of v7, v1, Landroid/widget/TextView;

    if-eqz v7, :cond_1

    check-cast v1, Landroid/widget/TextView;

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 161
    :cond_1
    if-lez p2, :cond_2

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lt v1, v5, :cond_2

    invoke-virtual {p1, v6}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v1, v1, Landroid/widget/ImageView;

    if-eqz v1, :cond_2

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    const/16 v1, 0xe

    invoke-static {p0, p2, v1, v4, v6}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 162
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {p2, v5}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x42000000    # 32.0f

    invoke-static {p0, v7}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-direct {v1, v7, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2, v6, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 163
    :cond_2
    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p2

    const/4 v0, 0x1

    if-eqz p2, :cond_3

    move p2, v0

    goto :goto_1

    :cond_3
    move p2, v6

    .line 164
    :goto_1
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    add-int/lit8 v7, p2, 0x2

    if-lt v1, v7, :cond_c

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v1, v1, Landroid/widget/ImageView;

    if-eqz v1, :cond_c

    add-int/2addr p2, v0

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v1, v1, Landroid/view/ViewGroup;

    if-nez v1, :cond_4

    goto/16 :goto_4

    .line 165
    :cond_4
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/view/ViewGroup;

    .line 166
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v1, v5, :cond_b

    invoke-virtual {p2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v1, v1, Landroid/widget/TextView;

    if-eqz v1, :cond_b

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v1, v1, Landroid/widget/TextView;

    if-nez v1, :cond_5

    goto/16 :goto_3

    .line 167
    :cond_5
    invoke-virtual {p2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    .line 168
    const-string v7, "sans-serif-medium"

    invoke-static {v7, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v7

    invoke-virtual {v1, v7, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    invoke-virtual {p2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 170
    invoke-virtual {p2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v7, "\u2665 "

    invoke-virtual {v1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-virtual {v1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 171
    :cond_6
    const/4 v8, -0x2

    const-string v9, "glass-row-duration"

    if-eqz v7, :cond_8

    const-string v7, "glass-row-heart"

    invoke-virtual {p1, v7}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v10

    if-nez v10, :cond_8

    const/16 v10, 0xf

    const v11, -0x19000001

    const-string v12, "\u2665\ufe0e"

    invoke-static {p0, v12, v10, v11, v6}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v10

    invoke-virtual {v10, v7}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    const-string v7, "Titre lik\u00e9"

    invoke-virtual {v10, v7}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 172
    invoke-virtual {v10, v3}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 v7, 0x41000000    # 8.0f

    invoke-static {p0, v7}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-virtual {v10, v7, v6, v6, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {p1, v9}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v7

    if-nez v7, :cond_7

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v7

    goto :goto_2

    :cond_7
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v7

    sub-int/2addr v7, v0

    :goto_2
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v11, v8, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v10, v7, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 173
    :cond_8
    invoke-virtual {p1, v9}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_9

    return-void

    .line 174
    :cond_9
    const-string v7, "^(.*?)\\s*\u2022\\s*(\\d+(?::\\d{2}){1,2})$"

    invoke-static {v7}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 175
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v7

    if-nez v7, :cond_a

    return-void

    .line 176
    :cond_a
    invoke-virtual {v1, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 177
    invoke-virtual {v1, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p2

    const/16 v0, 0xd

    invoke-static {p0, p2, v0, v4, v6}, Lcom/melodix/music/GlassScreenStyler;->text(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object p2

    invoke-virtual {p2, v9}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    const/high16 v0, 0x41400000    # 12.0f

    invoke-static {p0, v0}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result v0

    const/high16 v1, 0x40800000    # 4.0f

    invoke-static {p0, v1}, Lcom/melodix/music/GlassScreenStyler;->dp(Landroid/content/Context;F)I

    move-result p0

    invoke-virtual {p2, v0, v6, p0, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 178
    invoke-virtual {p2, v5}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    .line 179
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setGravity(I)V

    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v8, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 180
    return-void

    .line 166
    :cond_b
    :goto_3
    return-void

    .line 164
    :cond_c
    :goto_4
    return-void
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


# virtual methods
.method public onGlobalLayout()V
    .locals 3

    .line 198
    iget-object v0, p0, Lcom/melodix/music/GlassScreenStyler;->scroller:Landroid/widget/ScrollView;

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/melodix/music/GlassScreenStyler;->scrollTo:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/GlassScreenStyler;->scroller:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 199
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "nativeCurrentScreen"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    const/4 v0, 0x0

    .line 200
    :goto_0
    if-eqz v0, :cond_1

    const-string v1, "detail"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Lcom/melodix/music/GlassScreenStyler;->lastScreen:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/melodix/music/GlassScreenStyler;->scroller:Landroid/widget/ScrollView;

    invoke-static {v1, v0}, Lcom/melodix/music/GlassScreenStyler;->keepScroll(Landroid/view/View;Ljava/lang/String;)V

    .line 201
    :cond_1
    return-void

    .line 198
    :cond_2
    :goto_1
    return-void
.end method

.method public run()V
    .locals 3

    .line 193
    iget-object v0, p0, Lcom/melodix/music/GlassScreenStyler;->scroller:Landroid/widget/ScrollView;

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/melodix/music/GlassScreenStyler;->scrollTo:I

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/GlassScreenStyler;->scroller:Landroid/widget/ScrollView;

    const/4 v1, 0x0

    iget v2, p0, Lcom/melodix/music/GlassScreenStyler;->scrollTo:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ScrollView;->scrollTo(II)V

    :cond_0
    return-void

    .line 194
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/GlassScreenStyler;->waitImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_2

    iget v0, p0, Lcom/melodix/music/GlassScreenStyler;->waitTries:I

    const/4 v1, 0x4

    if-ge v0, v1, :cond_3

    :cond_2
    iget-object v0, p0, Lcom/melodix/music/GlassScreenStyler;->waitHero:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/melodix/music/GlassScreenStyler;->waitImage:Landroid/widget/ImageView;

    iget v2, p0, Lcom/melodix/music/GlassScreenStyler;->waitTries:I

    invoke-static {v0, v1, v2}, Lcom/melodix/music/GlassScreenStyler;->tint(Landroid/widget/LinearLayout;Landroid/widget/ImageView;I)V

    :cond_3
    return-void
.end method
