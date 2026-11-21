.class public final Lcom/melodix/music/PreviewPlayerPlayButton;
.super Landroid/widget/ImageView;
.source "PreviewPlayerPlayButton.java"


# instance fields
.field private iconFade:Landroid/animation/ObjectAnimator;

.field private lastIcon:I

.field private lastScale:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/melodix/music/PreviewPlayerPlayButton;->lastScale:F

    .line 16
    return-void
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerPlayButton;)I
    .locals 1

    .prologue
    .line 14
    iget v0, p0, Lcom/melodix/music/PreviewPlayerPlayButton;->lastIcon:I

    return v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerPlayButton;)F
    .locals 1

    .prologue
    .line 13
    iget v0, p0, Lcom/melodix/music/PreviewPlayerPlayButton;->lastScale:F

    return v0
.end method

.method static synthetic access$2(Lcom/melodix/music/PreviewPlayerPlayButton;F)V
    .locals 0

    .prologue
    .line 13
    iput p1, p0, Lcom/melodix/music/PreviewPlayerPlayButton;->lastScale:F

    return-void
.end method


# virtual methods
.method public setImageResource(I)V
    .locals 4

    .prologue
    .line 18
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 19
    const v0, 0x7f080121

    if-eq p1, v0, :cond_0

    const v0, 0x7f080122

    if-eq p1, v0, :cond_0

    .line 39
    :goto_0
    return-void

    .line 20
    :cond_0
    iget v0, p0, Lcom/melodix/music/PreviewPlayerPlayButton;->lastIcon:I

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/melodix/music/PreviewPlayerPlayButton;->lastIcon:I

    if-eq v0, p1, :cond_3

    .line 21
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerPlayButton;->iconFade:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerPlayButton;->iconFade:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 22
    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_2

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 23
    :cond_2
    const-string v0, "imageAlpha"

    const/4 v1, 0x2

    new-array v1, v1, [I

    fill-array-data v1, :array_0

    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerPlayButton;->iconFade:Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerPlayButton;->iconFade:Landroid/animation/ObjectAnimator;

    const-wide/16 v2, 0xb4

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerPlayButton;->iconFade:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 26
    :cond_3
    :goto_1
    iput p1, p0, Lcom/melodix/music/PreviewPlayerPlayButton;->lastIcon:I

    .line 27
    new-instance v0, Lcom/melodix/music/PreviewPlayerPlayButton$1;

    invoke-direct {v0, p0, p1}, Lcom/melodix/music/PreviewPlayerPlayButton$1;-><init>(Lcom/melodix/music/PreviewPlayerPlayButton;I)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerPlayButton;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 24
    :cond_4
    const/16 v0, 0xff

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerPlayButton;->setImageAlpha(I)V

    goto :goto_1

    .line 23
    :array_0
    .array-data 4
        0xb4
        0xff
    .end array-data
.end method
