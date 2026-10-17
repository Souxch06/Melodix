.class public final Ln82;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lsa2;

.field public final synthetic k:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lmd1;Lsa2;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ln82;->j:Lsa2;

    .line 5
    .line 6
    iput-object p3, p0, Ln82;->k:Ljava/lang/Runnable;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ln82;->j:Lsa2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lsa2;->V()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lsa2;->c()Ls02;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ls02;->l()V

    .line 11
    .line 12
    .line 13
    iget-object v1, v0, Lsa2;->y:Ljava/util/ArrayList;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    new-instance v1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v1, v0, Lsa2;->y:Ljava/util/ArrayList;

    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Ln82;->k:Ljava/lang/Runnable;

    .line 25
    .line 26
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lsa2;->q()V

    .line 30
    .line 31
    .line 32
    return-void
.end method
