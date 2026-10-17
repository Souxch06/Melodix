.class public final Ldw;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lew;


# direct methods
.method public constructor <init>(Lew;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ldw;->j:Lew;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object p0, p0, Ldw;->j:Lew;

    .line 2
    .line 3
    iget-object v0, p0, Lew;->b:Landroid/view/ViewGroup;

    .line 4
    .line 5
    iget-object v1, p0, Lew;->c:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lew;->d:Lfw;

    .line 11
    .line 12
    invoke-virtual {p0}, Ld7;->d()V

    .line 13
    .line 14
    .line 15
    return-void
.end method
