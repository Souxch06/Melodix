.class public Lqy0;
.super Landroid/view/ViewGroup$MarginLayoutParams;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Lmu0;

.field public final b:Landroid/graphics/Rect;

.field public c:Z

.field public d:Z


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 19
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lqy0;->b:Landroid/graphics/Rect;

    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Lqy0;->c:Z

    const/4 p1, 0x0

    .line 21
    iput-boolean p1, p0, Lqy0;->d:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lqy0;->b:Landroid/graphics/Rect;

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Lqy0;->c:Z

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lqy0;->d:Z

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lqy0;->b:Landroid/graphics/Rect;

    const/4 p1, 0x1

    .line 28
    iput-boolean p1, p0, Lqy0;->c:Z

    const/4 p1, 0x0

    .line 29
    iput-boolean p1, p0, Lqy0;->d:Z

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$MarginLayoutParams;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 23
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lqy0;->b:Landroid/graphics/Rect;

    const/4 p1, 0x1

    .line 24
    iput-boolean p1, p0, Lqy0;->c:Z

    const/4 p1, 0x0

    .line 25
    iput-boolean p1, p0, Lqy0;->d:Z

    return-void
.end method

.method public constructor <init>(Lqy0;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lqy0;->b:Landroid/graphics/Rect;

    const/4 p1, 0x1

    .line 32
    iput-boolean p1, p0, Lqy0;->c:Z

    const/4 p1, 0x0

    .line 33
    iput-boolean p1, p0, Lqy0;->d:Z

    return-void
.end method
