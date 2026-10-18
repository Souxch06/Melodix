.class public final Lot;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field public j:Lkw0;

.field public k:Lpa0;

.field public l:Lkw0;

.field public m:Lpa0;

.field public n:Lkw0;

.field public o:Lkw0;


# virtual methods
.method public final close()V
    .locals 0

    .line 1
    iget-object p0, p0, Lot;->n:Lkw0;

    .line 2
    .line 3
    invoke-interface {p0}, Lkw0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lh21;

    .line 8
    .line 9
    invoke-virtual {p0}, Lh21;->close()V

    .line 10
    .line 11
    .line 12
    return-void
.end method
