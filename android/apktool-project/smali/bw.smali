.class public final Lbw;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljava/util/ArrayList;

.field public final synthetic k:Lw81;


# direct methods
.method public constructor <init>(Lhw;Ljava/util/ArrayList;Lw81;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lbw;->j:Ljava/util/ArrayList;

    .line 5
    .line 6
    iput-object p3, p0, Lbw;->k:Lw81;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lbw;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object p0, p0, Lbw;->k:Lw81;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lw81;->c:Lh70;

    .line 15
    .line 16
    iget-object v0, v0, Lh70;->N:Landroid/view/View;

    .line 17
    .line 18
    iget p0, p0, Lw81;->a:I

    .line 19
    .line 20
    invoke-static {v0, p0}, Lx81;->a(Landroid/view/View;I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
