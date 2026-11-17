.class public final Lcom/melodix/music/GlassLikedMotion;
.super Ljava/lang/Object;
.source "GlassLikedMotion.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnScrollChangedListener;
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Landroid/view/View$OnAttachStateChangeListener;
.implements Ljava/lang/Runnable;


# static fields
.field private static final INSTANCES:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Landroid/widget/ScrollView;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/melodix/music/GlassLikedMotion;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private final bounds:Landroid/graphics/Rect;

.field private collection:Ljava/lang/String;

.field private content:Landroid/widget/LinearLayout;

.field private enabled:Z

.field private final heroVisible:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private lastY:I

.field private observer:Landroid/view/ViewTreeObserver;

.field private final preserve:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private rows:Landroid/view/ViewGroup;

.field private scheduled:Z

.field private final scroll:Landroid/widget/ScrollView;

.field private final visible:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/melodix/music/GlassLikedMotion;->INSTANCES:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>(Landroid/widget/ScrollView;)V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->collection:Ljava/lang/String;

    .line 31
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->visible:Ljava/util/HashMap;

    .line 32
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    .line 33
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->heroVisible:Ljava/util/HashMap;

    .line 36
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->bounds:Landroid/graphics/Rect;

    .line 39
    iput-object p1, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {p1, p0}, Landroid/widget/ScrollView;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->listen()V

    .line 40
    return-void
.end method

.method private animateRow(Landroid/view/View;I)V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 97
    invoke-static {p1}, Lcom/melodix/music/GlassLikedMotion;->parts(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 101
    :cond_0
    return-void

    .line 98
    :cond_1
    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0, p2, v1}, Lcom/melodix/music/GlassLikedMotion;->part(Landroid/view/View;II)V

    .line 99
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 100
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/TextView;

    if-eqz v2, :cond_2

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    mul-int/lit8 v3, v1, 0x19

    add-int/lit8 v3, v3, 0x1e

    invoke-direct {p0, v2, p2, v3}, Lcom/melodix/music/GlassLikedMotion;->part(Landroid/view/View;II)V

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static bind(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 42
    if-nez p0, :cond_1

    .line 54
    :cond_0
    :goto_0
    return-void

    .line 43
    :cond_1
    const v0, 0x7f090239

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 44
    instance-of v1, v0, Landroid/widget/ScrollView;

    if-eqz v1, :cond_0

    .line 45
    check-cast v0, Landroid/widget/ScrollView;

    .line 46
    sget-object v1, Lcom/melodix/music/GlassLikedMotion;->INSTANCES:Ljava/util/WeakHashMap;

    invoke-virtual {v1, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 47
    if-nez v1, :cond_4

    const/4 v1, 0x0

    .line 48
    :goto_1
    const-string v2, "detail"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-static {p3}, Lcom/melodix/music/GlassScreenStyler;->liked(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-static {p3}, Lcom/melodix/music/GlassScreenStyler;->playlist(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    if-eqz p1, :cond_3

    .line 49
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_3

    invoke-virtual {p1, v4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/view/ViewGroup;

    if-nez v2, :cond_5

    .line 50
    :cond_3
    if-eqz v1, :cond_0

    invoke-direct {v1}, Lcom/melodix/music/GlassLikedMotion;->dispose()V

    goto :goto_0

    .line 47
    :cond_4
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/melodix/music/GlassLikedMotion;

    goto :goto_1

    .line 52
    :cond_5
    if-nez v1, :cond_6

    new-instance v1, Lcom/melodix/music/GlassLikedMotion;

    invoke-direct {v1, v0}, Lcom/melodix/music/GlassLikedMotion;-><init>(Landroid/widget/ScrollView;)V

    sget-object v2, Lcom/melodix/music/GlassLikedMotion;->INSTANCES:Ljava/util/WeakHashMap;

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v2, v0, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    :cond_6
    invoke-virtual {p1, v4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-direct {v1, p1, v0, p3}, Lcom/melodix/music/GlassLikedMotion;->setRows(Landroid/widget/LinearLayout;Landroid/view/ViewGroup;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private dispose()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 150
    iput-boolean v1, p0, Lcom/melodix/music/GlassLikedMotion;->enabled:Z

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0, p0}, Landroid/widget/ScrollView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iput-boolean v1, p0, Lcom/melodix/music/GlassLikedMotion;->scheduled:Z

    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->resetAll()V

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->unlisten()V

    .line 151
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0, p0}, Landroid/widget/ScrollView;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    sget-object v0, Lcom/melodix/music/GlassLikedMotion;->INSTANCES:Ljava/util/WeakHashMap;

    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object v2, p0, Lcom/melodix/music/GlassLikedMotion;->content:Landroid/widget/LinearLayout;

    iput-object v2, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->collection:Ljava/lang/String;

    .line 152
    return-void
.end method

.method private hero(I)V
    .locals 7

    .prologue
    const/4 v1, 0x0

    .line 113
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 114
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 115
    const-string v0, "glass-playlist-hero"

    iget-object v3, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 116
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 117
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_0

    const/4 v3, 0x4

    if-lt v1, v3, :cond_2

    .line 125
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->heroVisible:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_4

    .line 126
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->heroVisible:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->heroVisible:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 127
    return-void

    .line 118
    :cond_2
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    rsub-int/lit8 v5, v1, -0x1

    .line 119
    invoke-virtual {v3, v4}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    if-lez v4, :cond_3

    .line 120
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    iget-object v4, p0, Lcom/melodix/music/GlassLikedMotion;->heroVisible:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    iget-object v4, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    mul-int/lit8 v4, v1, 0x1e

    invoke-direct {p0, v3, p1, v4}, Lcom/melodix/music/GlassLikedMotion;->part(Landroid/view/View;II)V

    .line 117
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 125
    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-static {v0}, Lcom/melodix/music/GlassLikedMotion;->reset(Landroid/view/View;)V

    goto :goto_1
.end method

.method private listen()V
    .locals 2

    .prologue
    .line 56
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_1

    .line 61
    :cond_0
    :goto_0
    return-void

    .line 57
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 58
    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    if-ne v1, v0, :cond_2

    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-nez v1, :cond_0

    .line 59
    :cond_2
    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->unlisten()V

    iput-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    .line 60
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_0
.end method

.method private motionOff()Z
    .locals 5

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 80
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    if-lt v2, v3, :cond_2

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 82
    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    .line 80
    goto :goto_0

    .line 81
    :cond_2
    :try_start_0
    iget-object v2, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v2}, Landroid/widget/ScrollView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "animator_duration_scale"

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Global;->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-nez v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 82
    :catch_0
    move-exception v0

    move v0, v1

    goto :goto_0
.end method

.method private part(Landroid/view/View;II)V
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 90
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_1

    .line 95
    :cond_0
    :goto_0
    return-void

    .line 91
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 92
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    const v1, 0x3eb33333    # 0.35f

    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    mul-int/lit8 v1, p2, 0x8

    int-to-float v1, v1

    mul-float/2addr v1, v0

    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    const/high16 v1, 0x40a00000    # 5.0f

    mul-float/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 93
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    int-to-long v2, p3

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xf0

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 94
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v2, 0x3fc00000    # 1.5f

    invoke-direct {v1, v2}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0
.end method

.method private static parts(Landroid/view/View;)Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 85
    instance-of v2, p0, Landroid/view/ViewGroup;

    if-eqz v2, :cond_0

    const-string v2, "glass-playlist-hero"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_0
    move v0, v1

    .line 87
    :cond_1
    :goto_0
    return v0

    .line 86
    :cond_2
    check-cast p0, Landroid/view/ViewGroup;

    .line 87
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    const/4 v3, 0x2

    if-lt v2, v3, :cond_3

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/ImageView;

    if-eqz v2, :cond_3

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/view/ViewGroup;

    if-nez v2, :cond_1

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method private static reset(Landroid/view/View;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 102
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setTranslationX(F)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setTranslationY(F)V

    return-void
.end method

.method private resetAll()V
    .locals 2

    .prologue
    .line 109
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->visible:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->visible:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 110
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->heroVisible:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->heroVisible:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 111
    return-void

    .line 109
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v0}, Lcom/melodix/music/GlassLikedMotion;->resetRow(Landroid/view/View;)V

    goto :goto_0

    .line 110
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v0}, Lcom/melodix/music/GlassLikedMotion;->reset(Landroid/view/View;)V

    goto :goto_1
.end method

.method private static resetRow(Landroid/view/View;)V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 104
    invoke-static {p0}, Lcom/melodix/music/GlassLikedMotion;->parts(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 107
    :cond_0
    return-void

    .line 105
    :cond_1
    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/GlassLikedMotion;->reset(Landroid/view/View;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 106
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/TextView;

    if-eqz v2, :cond_2

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Lcom/melodix/music/GlassLikedMotion;->reset(Landroid/view/View;)V

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private schedule()V
    .locals 1

    .prologue
    .line 77
    iget-boolean v0, p0, Lcom/melodix/music/GlassLikedMotion;->enabled:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/GlassLikedMotion;->scheduled:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/GlassLikedMotion;->scheduled:Z

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0, p0}, Landroid/widget/ScrollView;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 78
    :cond_0
    return-void
.end method

.method private setRows(Landroid/widget/LinearLayout;Landroid/view/ViewGroup;Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 69
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    if-ne v0, p2, :cond_0

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->collection:Ljava/lang/String;

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 70
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 71
    iget-boolean v0, p0, Lcom/melodix/music/GlassLikedMotion;->enabled:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->content:Landroid/widget/LinearLayout;

    if-ne v0, p1, :cond_1

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->collection:Ljava/lang/String;

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->visible:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->heroVisible:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 72
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->resetAll()V

    iput-object p1, p0, Lcom/melodix/music/GlassLikedMotion;->content:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    iput-object p3, p0, Lcom/melodix/music/GlassLikedMotion;->collection:Ljava/lang/String;

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v0

    iput v0, p0, Lcom/melodix/music/GlassLikedMotion;->lastY:I

    .line 74
    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/GlassLikedMotion;->enabled:Z

    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->listen()V

    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->schedule()V

    .line 75
    return-void
.end method

.method private unlisten()V
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 66
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    .line 67
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 0

    .prologue
    .line 154
    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->schedule()V

    return-void
.end method

.method public onScrollChanged()V
    .locals 0

    .prologue
    .line 153
    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->schedule()V

    return-void
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 0

    .prologue
    .line 155
    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->listen()V

    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->schedule()V

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 0

    .prologue
    .line 156
    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->dispose()V

    return-void
.end method

.method public run()V
    .locals 7

    .prologue
    const/4 v1, 0x0

    .line 129
    iput-boolean v1, p0, Lcom/melodix/music/GlassLikedMotion;->scheduled:Z

    .line 130
    iget-boolean v0, p0, Lcom/melodix/music/GlassLikedMotion;->enabled:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->content:Landroid/widget/LinearLayout;

    if-nez v0, :cond_1

    .line 148
    :cond_0
    :goto_0
    return-void

    .line 131
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v2, p0, Lcom/melodix/music/GlassLikedMotion;->content:Landroid/widget/LinearLayout;

    if-ne v0, v2, :cond_2

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_3

    :cond_2
    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->dispose()V

    goto :goto_0

    .line 132
    :cond_3
    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->motionOff()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->resetAll()V

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    goto :goto_0

    .line 133
    :cond_4
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/melodix/music/GlassLikedMotion;->bounds:Landroid/graphics/Rect;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->bounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    if-gtz v0, :cond_6

    :cond_5
    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->resetAll()V

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    goto :goto_0

    .line 134
    :cond_6
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v2

    iget v0, p0, Lcom/melodix/music/GlassLikedMotion;->lastY:I

    if-ge v2, v0, :cond_9

    const/4 v0, -0x1

    :goto_1
    iput v2, p0, Lcom/melodix/music/GlassLikedMotion;->lastY:I

    .line 135
    invoke-direct {p0, v0}, Lcom/melodix/music/GlassLikedMotion;->hero(I)V

    .line 136
    iget-object v2, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    move v2, v3

    .line 139
    :goto_2
    if-lt v1, v2, :cond_a

    .line 140
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 141
    :goto_3
    if-lt v1, v3, :cond_c

    .line 146
    :cond_7
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->visible:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_8
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_f

    .line 147
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->visible:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->visible:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    goto :goto_0

    .line 134
    :cond_9
    const/4 v0, 0x1

    goto :goto_1

    .line 139
    :cond_a
    add-int v4, v1, v2

    ushr-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getBottom()I

    move-result v5

    iget-object v6, p0, Lcom/melodix/music/GlassLikedMotion;->bounds:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->top:I

    if-gt v5, v6, :cond_b

    add-int/lit8 v1, v4, 0x1

    goto :goto_2

    :cond_b
    move v2, v4

    goto :goto_2

    .line 142
    :cond_c
    iget-object v4, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v5

    iget-object v6, p0, Lcom/melodix/music/GlassLikedMotion;->bounds:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    if-ge v5, v6, :cond_7

    .line 143
    invoke-static {v4}, Lcom/melodix/music/GlassLikedMotion;->parts(Landroid/view/View;)Z

    move-result v5

    if-nez v5, :cond_e

    .line 141
    :cond_d
    :goto_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 143
    :cond_e
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    iget-object v5, p0, Lcom/melodix/music/GlassLikedMotion;->visible:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_d

    iget-object v5, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_d

    invoke-direct {p0, v4, v0}, Lcom/melodix/music/GlassLikedMotion;->animateRow(Landroid/view/View;I)V

    goto :goto_5

    .line 146
    :cond_f
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    invoke-static {v0}, Lcom/melodix/music/GlassLikedMotion;->resetRow(Landroid/view/View;)V

    goto :goto_4
.end method
