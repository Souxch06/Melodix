.class public final Ls52;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:J

.field public final synthetic k:Lz52;


# direct methods
.method public constructor <init>(Lz52;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p2, p0, Ls52;->j:J

    .line 5
    .line 6
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ls52;->k:Lz52;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ls52;->k:Lz52;

    .line 2
    .line 3
    iget-object v1, v0, Let;->j:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ly02;

    .line 6
    .line 7
    iget-object v1, v1, Ly02;->w:Lfw1;

    .line 8
    .line 9
    invoke-static {v1}, Ly02;->i(Lgx1;)V

    .line 10
    .line 11
    .line 12
    iget-wide v2, p0, Ls52;->j:J

    .line 13
    .line 14
    invoke-virtual {v1, v2, v3}, Lfw1;->o(J)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    iput-object p0, v0, Lz52;->n:Lm52;

    .line 19
    .line 20
    return-void
.end method
