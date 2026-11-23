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
            "Ljava/util/WeakHashMap<",
            "Landroid/widget/ScrollView;",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/melodix/music/GlassLikedMotion;",
            ">;>;"
        }
    .end annotation
.end field

.field private static rerendered:Ljava/lang/String;


# instance fields
.field private final bounds:Landroid/graphics/Rect;

.field private collection:Ljava/lang/String;

.field private content:Landroid/widget/LinearLayout;

.field private enabled:Z

.field private final heroVisible:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
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
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private quiet:Z

.field private rows:Landroid/view/ViewGroup;

.field private scheduled:Z

.field private final scroll:Landroid/widget/ScrollView;

.field private final visible:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 25
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/melodix/music/GlassLikedMotion;->INSTANCES:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>(Landroid/widget/ScrollView;)V
    .locals 1

    .line 40
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

    .line 38
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->bounds:Landroid/graphics/Rect;

    .line 41
    iput-object p1, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {p1, p0}, Landroid/widget/ScrollView;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->listen()V

    .line 42
    return-void
.end method

.method private animateRow(Landroid/view/View;I)V
    .locals 4

    .line 107
    invoke-static {p1}, Lcom/melodix/music/GlassLikedMotion;->parts(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 108
    :cond_0
    check-cast p1, Landroid/view/ViewGroup;

    invoke-static {p1}, Lcom/melodix/music/GlassLikedMotion;->cover(Landroid/view/ViewGroup;)I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-gt v2, v0, :cond_1

    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {p0, v3, p2, v1}, Lcom/melodix/music/GlassLikedMotion;->part(Landroid/view/View;II)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 109
    :cond_1
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    .line 110
    nop

    :goto_1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-ge v1, v0, :cond_3

    const/4 v0, 0x2

    if-ge v1, v0, :cond_3

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/TextView;

    if-eqz v0, :cond_2

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    mul-int/lit8 v2, v1, 0x19

    add-int/lit8 v2, v2, 0x1e

    invoke-direct {p0, v0, p2, v2}, Lcom/melodix/music/GlassLikedMotion;->part(Landroid/view/View;II)V

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 111
    :cond_3
    return-void
.end method

.method public static bind(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    .line 44
    if-nez p0, :cond_0

    return-void

    .line 45
    :cond_0
    const v0, 0x7f090239

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 46
    instance-of v0, p0, Landroid/widget/ScrollView;

    if-nez v0, :cond_1

    return-void

    .line 47
    :cond_1
    check-cast p0, Landroid/widget/ScrollView;

    .line 48
    sget-object v0, Lcom/melodix/music/GlassLikedMotion;->INSTANCES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 49
    const/4 v1, 0x0

    if-nez v0, :cond_2

    move-object v0, v1

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/melodix/music/GlassLikedMotion;

    .line 50
    :goto_0
    const-string v2, "detail"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz p2, :cond_4

    invoke-static {p3}, Lcom/melodix/music/GlassScreenStyler;->liked(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_3

    invoke-static {p3}, Lcom/melodix/music/GlassScreenStyler;->playlist(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_4

    :cond_3
    move p2, v2

    goto :goto_1

    :cond_4
    move p2, v3

    .line 51
    :goto_1
    if-eqz p2, :cond_7

    if-eqz p1, :cond_7

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    if-ne v4, v2, :cond_7

    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/view/ViewGroup;

    if-nez v2, :cond_5

    goto :goto_2

    .line 56
    :cond_5
    if-nez v0, :cond_6

    new-instance v0, Lcom/melodix/music/GlassLikedMotion;

    invoke-direct {v0, p0}, Lcom/melodix/music/GlassLikedMotion;-><init>(Landroid/widget/ScrollView;)V

    sget-object p2, Lcom/melodix/music/GlassLikedMotion;->INSTANCES:Ljava/util/WeakHashMap;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    :cond_6
    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    invoke-direct {v0, p1, p0, p3}, Lcom/melodix/music/GlassLikedMotion;->setRows(Landroid/widget/LinearLayout;Landroid/view/ViewGroup;Ljava/lang/String;)V

    .line 58
    return-void

    .line 52
    :cond_7
    :goto_2
    if-eqz p2, :cond_8

    if-eqz v0, :cond_8

    iget-object p0, v0, Lcom/melodix/music/GlassLikedMotion;->collection:Ljava/lang/String;

    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8

    goto :goto_3

    :cond_8
    move-object p3, v1

    .line 53
    :goto_3
    if-eqz v0, :cond_9

    invoke-direct {v0}, Lcom/melodix/music/GlassLikedMotion;->dispose()V

    .line 54
    :cond_9
    sput-object p3, Lcom/melodix/music/GlassLikedMotion;->rerendered:Ljava/lang/String;

    return-void
.end method

.method private static cover(Landroid/view/ViewGroup;)I
    .locals 3

    .line 92
    const/4 v0, 0x0

    :goto_0
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    const/4 v2, 0x3

    if-ge v0, v2, :cond_1

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/ImageView;

    if-eqz v2, :cond_0

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/view/ViewGroup;

    if-eqz v2, :cond_0

    return v0

    :cond_0
    move v0, v1

    goto :goto_0

    .line 93
    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method private dispose()V
    .locals 2

    .line 169
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/GlassLikedMotion;->enabled:Z

    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v1, p0}, Landroid/widget/ScrollView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iput-boolean v0, p0, Lcom/melodix/music/GlassLikedMotion;->scheduled:Z

    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->resetAll()V

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->unlisten()V

    .line 170
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0, p0}, Landroid/widget/ScrollView;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    sget-object v0, Lcom/melodix/music/GlassLikedMotion;->INSTANCES:Ljava/util/WeakHashMap;

    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->content:Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->collection:Ljava/lang/String;

    .line 171
    return-void
.end method

.method private hero(I)V
    .locals 7

    .line 123
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 124
    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v1, v1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    .line 125
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    const-string v3, "glass-playlist-hero"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 126
    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 127
    nop

    :goto_0
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_1

    const/4 v3, 0x4

    if-ge v2, v3, :cond_1

    .line 128
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    rsub-int/lit8 v5, v2, -0x1

    .line 129
    invoke-virtual {v3, v4}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    if-lez v4, :cond_0

    .line 130
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    iget-object v4, p0, Lcom/melodix/music/GlassLikedMotion;->heroVisible:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    mul-int/lit8 v4, v2, 0x1e

    invoke-direct {p0, v3, p1, v4}, Lcom/melodix/music/GlassLikedMotion;->part(Landroid/view/View;II)V

    .line 127
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 135
    :cond_1
    iget-object p1, p0, Lcom/melodix/music/GlassLikedMotion;->heroVisible:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-static {v1}, Lcom/melodix/music/GlassLikedMotion;->reset(Landroid/view/View;)V

    goto :goto_1

    .line 136
    :cond_3
    iget-object p1, p0, Lcom/melodix/music/GlassLikedMotion;->heroVisible:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V

    iget-object p1, p0, Lcom/melodix/music/GlassLikedMotion;->heroVisible:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 137
    return-void
.end method

.method private listen()V
    .locals 2

    .line 60
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 61
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 62
    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    if-ne v1, v0, :cond_1

    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    .line 63
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->unlisten()V

    iput-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    .line 64
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 65
    :cond_2
    return-void
.end method

.method private markVisible()V
    .locals 6

    .line 162
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->visible:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->heroVisible:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 163
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    const-string v2, "glass-playlist-hero"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 164
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    move v2, v1

    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_0

    const/4 v3, 0x4

    if-ge v2, v3, :cond_0

    iget-object v3, p0, Lcom/melodix/music/GlassLikedMotion;->heroVisible:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    rsub-int/lit8 v5, v2, -0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 166
    :cond_0
    nop

    :goto_1
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-ge v1, v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v2

    iget-object v3, p0, Lcom/melodix/music/GlassLikedMotion;->bounds:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    if-lt v2, v3, :cond_1

    goto :goto_2

    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v2

    iget-object v3, p0, Lcom/melodix/music/GlassLikedMotion;->bounds:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    if-le v2, v3, :cond_2

    invoke-static {v0}, Lcom/melodix/music/GlassLikedMotion;->parts(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/melodix/music/GlassLikedMotion;->visible:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 167
    :cond_3
    :goto_2
    return-void
.end method

.method private motionOff()Z
    .locals 4

    .line 85
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    const/4 v2, 0x1

    if-lt v0, v1, :cond_0

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v0

    xor-int/2addr v0, v2

    return v0

    .line 86
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "animator_duration_scale"

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v0, v1, v3}, Landroid/provider/Settings$Global;->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F

    move-result v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    return v2

    .line 87
    :catch_0
    move-exception v0

    return v2
.end method

.method private part(Landroid/view/View;II)V
    .locals 2

    .line 100
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 101
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 102
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    const v1, 0x3eb33333    # 0.35f

    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    mul-int/lit8 p2, p2, 0x8

    int-to-float p2, p2

    mul-float/2addr p2, v0

    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationY(F)V

    const/high16 p2, 0x40a00000    # 5.0f

    mul-float/2addr v0, p2

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 103
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    int-to-long p2, p3

    invoke-virtual {p1, p2, p3}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 p2, 0xf0

    invoke-virtual {p1, p2, p3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance p2, Landroid/view/animation/DecelerateInterpolator;

    const/high16 p3, 0x3fc00000    # 1.5f

    invoke-direct {p2, p3}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    .line 104
    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 105
    return-void

    .line 100
    :cond_1
    :goto_0
    return-void
.end method

.method private static parts(Landroid/view/View;)Z
    .locals 3

    .line 96
    instance-of v0, p0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    const-string v0, "glass-playlist-hero"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 97
    :cond_0
    check-cast p0, Landroid/view/ViewGroup;

    invoke-static {p0}, Lcom/melodix/music/GlassLikedMotion;->cover(Landroid/view/ViewGroup;)I

    move-result p0

    if-ltz p0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1

    .line 96
    :cond_2
    :goto_0
    return v1
.end method

.method private static reset(Landroid/view/View;)V
    .locals 1

    .line 112
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    return-void
.end method

.method private resetAll()V
    .locals 2

    .line 119
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->visible:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-static {v1}, Lcom/melodix/music/GlassLikedMotion;->resetRow(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->visible:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 120
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->heroVisible:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-static {v1}, Lcom/melodix/music/GlassLikedMotion;->reset(Landroid/view/View;)V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->heroVisible:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 121
    return-void
.end method

.method private static resetRow(Landroid/view/View;)V
    .locals 4

    .line 114
    invoke-static {p0}, Lcom/melodix/music/GlassLikedMotion;->parts(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 115
    :cond_0
    check-cast p0, Landroid/view/ViewGroup;

    invoke-static {p0}, Lcom/melodix/music/GlassLikedMotion;->cover(Landroid/view/ViewGroup;)I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-gt v2, v0, :cond_1

    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3}, Lcom/melodix/music/GlassLikedMotion;->reset(Landroid/view/View;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    .line 116
    nop

    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-ge v1, v0, :cond_3

    const/4 v0, 0x2

    if-ge v1, v0, :cond_3

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/TextView;

    if-eqz v0, :cond_2

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/GlassLikedMotion;->reset(Landroid/view/View;)V

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 117
    :cond_3
    return-void
.end method

.method private schedule()V
    .locals 1

    .line 82
    iget-boolean v0, p0, Lcom/melodix/music/GlassLikedMotion;->enabled:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/GlassLikedMotion;->scheduled:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/GlassLikedMotion;->scheduled:Z

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0, p0}, Landroid/widget/ScrollView;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 83
    :cond_0
    return-void
.end method

.method private setRows(Landroid/widget/LinearLayout;Landroid/view/ViewGroup;Ljava/lang/String;)V
    .locals 3

    .line 73
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    const/4 v1, 0x1

    if-ne v0, p2, :cond_0

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->collection:Ljava/lang/String;

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 74
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 75
    iget-boolean v0, p0, Lcom/melodix/music/GlassLikedMotion;->enabled:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->content:Landroid/widget/LinearLayout;

    if-ne v0, p1, :cond_1

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->collection:Ljava/lang/String;

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    iget-object v2, p0, Lcom/melodix/music/GlassLikedMotion;->visible:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    iget-object v2, p0, Lcom/melodix/music/GlassLikedMotion;->heroVisible:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 76
    :cond_1
    sget-object v0, Lcom/melodix/music/GlassLikedMotion;->rerendered:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/melodix/music/GlassLikedMotion;->enabled:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->collection:Ljava/lang/String;

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    :cond_3
    :goto_0
    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/melodix/music/GlassLikedMotion;->quiet:Z

    const/4 v0, 0x0

    sput-object v0, Lcom/melodix/music/GlassLikedMotion;->rerendered:Ljava/lang/String;

    .line 77
    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->resetAll()V

    iput-object p1, p0, Lcom/melodix/music/GlassLikedMotion;->content:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    iput-object p3, p0, Lcom/melodix/music/GlassLikedMotion;->collection:Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {p1}, Landroid/widget/ScrollView;->getScrollY()I

    move-result p1

    iput p1, p0, Lcom/melodix/music/GlassLikedMotion;->lastY:I

    .line 79
    :cond_4
    iput-boolean v1, p0, Lcom/melodix/music/GlassLikedMotion;->enabled:Z

    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->listen()V

    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->schedule()V

    .line 80
    return-void
.end method

.method private unlisten()V
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 68
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 70
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->observer:Landroid/view/ViewTreeObserver;

    .line 71
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 0

    .line 173
    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->schedule()V

    return-void
.end method

.method public onScrollChanged()V
    .locals 0

    .line 172
    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->schedule()V

    return-void
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 0

    .line 174
    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->listen()V

    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->schedule()V

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 0

    .line 175
    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->dispose()V

    return-void
.end method

.method public run()V
    .locals 8

    .line 139
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/GlassLikedMotion;->scheduled:Z

    .line 140
    iget-boolean v1, p0, Lcom/melodix/music/GlassLikedMotion;->enabled:Z

    if-eqz v1, :cond_11

    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    if-eqz v1, :cond_11

    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->content:Landroid/widget/LinearLayout;

    if-nez v1, :cond_0

    goto/16 :goto_9

    .line 141
    :cond_0
    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    iget-object v2, p0, Lcom/melodix/music/GlassLikedMotion;->content:Landroid/widget/LinearLayout;

    if-ne v1, v2, :cond_f

    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v1}, Landroid/widget/ScrollView;->isAttachedToWindow()Z

    move-result v1

    if-nez v1, :cond_1

    goto/16 :goto_7

    .line 142
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->motionOff()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->resetAll()V

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    return-void

    .line 143
    :cond_2
    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/melodix/music/GlassLikedMotion;->bounds:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v1

    if-eqz v1, :cond_e

    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->bounds:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    if-gtz v1, :cond_3

    goto/16 :goto_6

    .line 144
    :cond_3
    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v1}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v1

    iget v2, p0, Lcom/melodix/music/GlassLikedMotion;->lastY:I

    const/4 v3, 0x1

    if-ge v1, v2, :cond_4

    const/4 v2, -0x1

    goto :goto_0

    :cond_4
    move v2, v3

    :goto_0
    iput v1, p0, Lcom/melodix/music/GlassLikedMotion;->lastY:I

    .line 145
    iget-boolean v1, p0, Lcom/melodix/music/GlassLikedMotion;->quiet:Z

    if-eqz v1, :cond_5

    iput-boolean v0, p0, Lcom/melodix/music/GlassLikedMotion;->quiet:Z

    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->markVisible()V

    return-void

    .line 146
    :cond_5
    invoke-direct {p0, v2}, Lcom/melodix/music/GlassLikedMotion;->hero(I)V

    .line 147
    iget-object v1, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    move v4, v1

    .line 150
    :goto_1
    if-ge v0, v4, :cond_7

    add-int v5, v0, v4

    ushr-int/2addr v5, v3

    iget-object v6, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v6, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getBottom()I

    move-result v6

    iget-object v7, p0, Lcom/melodix/music/GlassLikedMotion;->bounds:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    if-gt v6, v7, :cond_6

    add-int/lit8 v5, v5, 0x1

    move v0, v5

    goto :goto_1

    :cond_6
    move v4, v5

    goto :goto_1

    .line 151
    :cond_7
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 152
    nop

    :goto_2
    if-ge v0, v1, :cond_b

    .line 153
    iget-object v4, p0, Lcom/melodix/music/GlassLikedMotion;->rows:Landroid/view/ViewGroup;

    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v5

    iget-object v6, p0, Lcom/melodix/music/GlassLikedMotion;->bounds:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    if-lt v5, v6, :cond_8

    goto :goto_4

    .line 154
    :cond_8
    invoke-static {v4}, Lcom/melodix/music/GlassLikedMotion;->parts(Landroid/view/View;)Z

    move-result v5

    if-nez v5, :cond_9

    goto :goto_3

    :cond_9
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    iget-object v5, p0, Lcom/melodix/music/GlassLikedMotion;->visible:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_a

    iget-object v5, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_a

    invoke-direct {p0, v4, v2}, Lcom/melodix/music/GlassLikedMotion;->animateRow(Landroid/view/View;I)V

    .line 152
    :cond_a
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 157
    :cond_b
    :goto_4
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->visible:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_c
    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c

    invoke-static {v1}, Lcom/melodix/music/GlassLikedMotion;->resetRow(Landroid/view/View;)V

    goto :goto_5

    .line 158
    :cond_d
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->visible:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->visible:Ljava/util/HashMap;

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 159
    return-void

    .line 143
    :cond_e
    :goto_6
    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->resetAll()V

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->preserve:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    return-void

    .line 141
    :cond_f
    :goto_7
    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/melodix/music/GlassLikedMotion;->collection:Ljava/lang/String;

    goto :goto_8

    :cond_10
    const/4 v0, 0x0

    :goto_8
    invoke-direct {p0}, Lcom/melodix/music/GlassLikedMotion;->dispose()V

    sput-object v0, Lcom/melodix/music/GlassLikedMotion;->rerendered:Ljava/lang/String;

    return-void

    .line 140
    :cond_11
    :goto_9
    return-void
.end method
