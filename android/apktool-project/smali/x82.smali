.class public final Lx82;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final j:J

.field public final k:J

.field public final synthetic l:Lxn0;


# direct methods
.method public constructor <init>(Lxn0;JJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lx82;->l:Lxn0;

    .line 8
    .line 9
    iput-wide p2, p0, Lx82;->j:J

    .line 10
    .line 11
    iput-wide p4, p0, Lx82;->k:J

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lx82;->l:Lxn0;

    .line 2
    .line 3
    iget-object v0, v0, Lxn0;->l:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Lh92;

    .line 6
    .line 7
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ly02;

    .line 10
    .line 11
    iget-object v0, v0, Ly02;->p:Ls02;

    .line 12
    .line 13
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Lw82;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lw82;-><init>(Lx82;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
