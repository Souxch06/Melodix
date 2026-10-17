.class public final Lm11;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final j:I

.field public final k:Landroid/os/Bundle;

.field public final synthetic l:Ln11;


# direct methods
.method public constructor <init>(Ln11;ILandroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lm11;->l:Ln11;

    .line 5
    .line 6
    iput p2, p0, Lm11;->j:I

    .line 7
    .line 8
    iput-object p3, p0, Lm11;->k:Landroid/os/Bundle;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget v0, p0, Lm11;->j:I

    .line 2
    .line 3
    iget-object v1, p0, Lm11;->k:Landroid/os/Bundle;

    .line 4
    .line 5
    iget-object p0, p0, Lm11;->l:Ln11;

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Ln11;->onReceiveResult(ILandroid/os/Bundle;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
