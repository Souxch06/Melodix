.class public final Llx;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lpx;


# direct methods
.method public constructor <init>(Lpx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Llx;->j:Lpx;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object p0, p0, Llx;->j:Lpx;

    .line 2
    .line 3
    iget-object v0, p0, Lpx;->e0:Lnx;

    .line 4
    .line 5
    iget-object p0, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lnx;->onDismiss(Landroid/content/DialogInterface;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
