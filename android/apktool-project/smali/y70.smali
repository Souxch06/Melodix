.class public final Ly70;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lx70;


# instance fields
.field public final a:I

.field public final synthetic b:Lz70;


# direct methods
.method public constructor <init>(Lz70;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ly70;->b:Lz70;

    .line 5
    .line 6
    iput p2, p0, Ly70;->a:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ly70;->b:Lz70;

    .line 2
    .line 3
    iget-object v1, v0, Lz70;->w:Lh70;

    .line 4
    .line 5
    iget p0, p0, Ly70;->a:I

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    if-gez p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Lh70;->h()Lz70;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Lz70;->M()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, p1, p2, p0, v1}, Lz70;->N(Ljava/util/ArrayList;Ljava/util/ArrayList;II)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method
