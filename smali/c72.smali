.class public final Lc72;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lbc2;

.field public final synthetic k:Z

.field public final synthetic l:Ltu1;

.field public final synthetic m:Li82;


# direct methods
.method public constructor <init>(Li82;Lbc2;ZLtu1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lc72;->j:Lbc2;

    .line 5
    .line 6
    iput-boolean p3, p0, Lc72;->k:Z

    .line 7
    .line 8
    iput-object p4, p0, Lc72;->l:Ltu1;

    .line 9
    .line 10
    iput-object p1, p0, Lc72;->m:Li82;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lc72;->m:Li82;

    .line 2
    .line 3
    iget-object v1, v0, Li82;->m:Lcy1;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    iget-object p0, v0, Let;->j:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Ly02;

    .line 10
    .line 11
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 12
    .line 13
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 17
    .line 18
    const-string v0, "Discarding data. Failed to send event to service"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lso;->b(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-boolean v2, p0, Lc72;->k:Z

    .line 25
    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-object v2, p0, Lc72;->l:Ltu1;

    .line 31
    .line 32
    :goto_0
    iget-object p0, p0, Lc72;->j:Lbc2;

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2, p0}, Li82;->D(Lcy1;Ls0;Lbc2;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Li82;->y()V

    .line 38
    .line 39
    .line 40
    return-void
.end method
