.class public final Lu81;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lw81;

.field public final synthetic k:Lhw;


# direct methods
.method public constructor <init>(Lhw;Lw81;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lu81;->k:Lhw;

    .line 5
    .line 6
    iput-object p2, p0, Lu81;->j:Lw81;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lu81;->k:Lhw;

    .line 2
    .line 3
    iget-object v0, v0, Lhw;->b:Ljava/util/ArrayList;

    .line 4
    .line 5
    iget-object p0, p0, Lu81;->j:Lw81;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget v0, p0, Lw81;->a:I

    .line 14
    .line 15
    iget-object p0, p0, Lw81;->c:Lh70;

    .line 16
    .line 17
    iget-object p0, p0, Lh70;->N:Landroid/view/View;

    .line 18
    .line 19
    invoke-static {p0, v0}, Lx81;->a(Landroid/view/View;I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
