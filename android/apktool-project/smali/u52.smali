.class public final Lu52;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lm52;

.field public final synthetic k:J

.field public final synthetic l:Lz52;


# direct methods
.method public constructor <init>(Lz52;Lm52;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lu52;->j:Lm52;

    .line 5
    .line 6
    iput-wide p3, p0, Lu52;->k:J

    .line 7
    .line 8
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lu52;->l:Lz52;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lu52;->k:J

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    iget-object v3, p0, Lu52;->l:Lz52;

    .line 5
    .line 6
    iget-object p0, p0, Lu52;->j:Lm52;

    .line 7
    .line 8
    invoke-virtual {v3, p0, v2, v0, v1}, Lz52;->u(Lm52;ZJ)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    iput-object p0, v3, Lz52;->n:Lm52;

    .line 13
    .line 14
    iget-object v0, v3, Let;->j:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Ly02;

    .line 17
    .line 18
    invoke-virtual {v0}, Ly02;->n()Li82;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lgx1;->l()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Lay1;->m()V

    .line 26
    .line 27
    .line 28
    new-instance v1, Lu62;

    .line 29
    .line 30
    invoke-direct {v1, v0, p0}, Lu62;-><init>(Li82;Lm52;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Li82;->z(Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
