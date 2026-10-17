.class public final synthetic Lp4;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lcom/melodix/music/MainActivity;

.field public final synthetic k:I

.field public final synthetic l:I


# direct methods
.method public synthetic constructor <init>(Lcom/melodix/music/MainActivity;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lp4;->j:Lcom/melodix/music/MainActivity;

    .line 5
    .line 6
    iput p2, p0, Lp4;->k:I

    .line 7
    .line 8
    iput p3, p0, Lp4;->l:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget v0, p0, Lp4;->k:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Lp4;->l:I

    .line 6
    .line 7
    if-lez v1, :cond_0

    .line 8
    .line 9
    new-instance v2, Landroid/util/Rational;

    .line 10
    .line 11
    invoke-direct {v2, v0, v1}, Landroid/util/Rational;-><init>(II)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    new-instance v2, Landroid/util/Rational;

    .line 16
    .line 17
    const/16 v0, 0x9

    .line 18
    .line 19
    const/16 v1, 0x10

    .line 20
    .line 21
    invoke-direct {v2, v0, v1}, Landroid/util/Rational;-><init>(II)V

    .line 22
    .line 23
    .line 24
    :goto_0
    iget-object p0, p0, Lp4;->j:Lcom/melodix/music/MainActivity;

    .line 25
    .line 26
    iput-object v2, p0, Lcom/melodix/music/MainActivity;->b0:Landroid/util/Rational;

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->c0:Z

    .line 30
    .line 31
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;

    .line 32
    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    sget-object v1, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 36
    .line 37
    :cond_1
    if-nez v1, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->v(Z)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    new-instance v0, Lo6;

    .line 44
    .line 45
    const/16 v2, 0xb

    .line 46
    .line 47
    invoke-direct {v0, v1, v2, p0}, Lo6;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 51
    .line 52
    .line 53
    return-void
.end method
