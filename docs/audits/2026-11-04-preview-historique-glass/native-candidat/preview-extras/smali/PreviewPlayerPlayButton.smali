.class public final Lcom/melodix/music/PreviewPlayerPlayButton;
.super Landroid/widget/ImageView;
.source "PreviewPlayerPlayButton.java"


# instance fields
.field private lastScale:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 12
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/melodix/music/PreviewPlayerPlayButton;->lastScale:F

    .line 13
    return-void
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerPlayButton;)F
    .locals 1

    .prologue
    .line 12
    iget v0, p0, Lcom/melodix/music/PreviewPlayerPlayButton;->lastScale:F

    return v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerPlayButton;F)V
    .locals 0

    .prologue
    .line 12
    iput p1, p0, Lcom/melodix/music/PreviewPlayerPlayButton;->lastScale:F

    return-void
.end method


# virtual methods
.method public setImageResource(I)V
    .locals 1

    .prologue
    .line 15
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 16
    const v0, 0x7f080121

    if-eq p1, v0, :cond_0

    const v0, 0x7f080122

    if-eq p1, v0, :cond_0

    .line 29
    :goto_0
    return-void

    .line 17
    :cond_0
    new-instance v0, Lcom/melodix/music/PreviewPlayerPlayButton$1;

    invoke-direct {v0, p0, p1}, Lcom/melodix/music/PreviewPlayerPlayButton$1;-><init>(Lcom/melodix/music/PreviewPlayerPlayButton;I)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerPlayButton;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method
