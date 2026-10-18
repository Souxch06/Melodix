.class public final Ln52;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Landroid/os/Bundle;

.field public final synthetic k:Lm52;

.field public final synthetic l:Lm52;

.field public final synthetic m:J

.field public final synthetic n:Lz52;


# direct methods
.method public constructor <init>(Lz52;Landroid/os/Bundle;Lm52;Lm52;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ln52;->j:Landroid/os/Bundle;

    .line 5
    .line 6
    iput-object p3, p0, Ln52;->k:Lm52;

    .line 7
    .line 8
    iput-object p4, p0, Ln52;->l:Lm52;

    .line 9
    .line 10
    iput-wide p5, p0, Ln52;->m:J

    .line 11
    .line 12
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ln52;->n:Lz52;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    const-string v0, "screen_name"

    .line 2
    .line 3
    iget-object v1, p0, Ln52;->j:Landroid/os/Bundle;

    .line 4
    .line 5
    invoke-virtual {v1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "screen_class"

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Ln52;->n:Lz52;

    .line 14
    .line 15
    iget-object v0, v2, Let;->j:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Ly02;

    .line 18
    .line 19
    iget-object v0, v0, Ly02;->r:Lcb2;

    .line 20
    .line 21
    invoke-static {v0}, Ly02;->j(Let;)V

    .line 22
    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    const/4 v4, 0x0

    .line 26
    const-string v5, "screen_view"

    .line 27
    .line 28
    invoke-virtual {v0, v5, v1, v3, v4}, Lcb2;->v(Ljava/lang/String;Landroid/os/Bundle;Ljava/util/List;Z)Landroid/os/Bundle;

    .line 29
    .line 30
    .line 31
    move-result-object v8

    .line 32
    iget-wide v5, p0, Ln52;->m:J

    .line 33
    .line 34
    const/4 v7, 0x1

    .line 35
    iget-object v3, p0, Ln52;->k:Lm52;

    .line 36
    .line 37
    iget-object v4, p0, Ln52;->l:Lm52;

    .line 38
    .line 39
    invoke-virtual/range {v2 .. v8}, Lz52;->r(Lm52;Lm52;JZLandroid/os/Bundle;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
