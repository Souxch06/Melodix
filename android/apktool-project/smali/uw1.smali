.class public final Luw1;
.super Lzw1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic n:Ljava/lang/String;

.field public final synthetic o:Ljava/lang/String;

.field public final synthetic p:Z

.field public final synthetic q:Lqv1;

.field public final synthetic r:Ldx1;


# direct methods
.method public constructor <init>(Ldx1;Ljava/lang/String;Ljava/lang/String;ZLqv1;)V
    .locals 0

    .line 1
    iput-object p2, p0, Luw1;->n:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Luw1;->o:Ljava/lang/String;

    .line 4
    .line 5
    iput-boolean p4, p0, Luw1;->p:Z

    .line 6
    .line 7
    iput-object p5, p0, Luw1;->q:Lqv1;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Luw1;->r:Ldx1;

    .line 13
    .line 14
    const/4 p2, 0x1

    .line 15
    invoke-direct {p0, p1, p2}, Lzw1;-><init>(Ldx1;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    .line 1
    iget-object v0, p0, Luw1;->r:Ldx1;

    .line 2
    .line 3
    iget-object v0, v0, Ldx1;->f:Ltv1;

    .line 4
    .line 5
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Luw1;->n:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v2, p0, Luw1;->o:Ljava/lang/String;

    .line 11
    .line 12
    iget-boolean v3, p0, Luw1;->p:Z

    .line 13
    .line 14
    iget-object p0, p0, Luw1;->q:Lqv1;

    .line 15
    .line 16
    invoke-interface {v0, v1, v2, v3, p0}, Ltv1;->getUserProperties(Ljava/lang/String;Ljava/lang/String;ZLvv1;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final b()V
    .locals 1

    .line 1
    iget-object p0, p0, Luw1;->q:Lqv1;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lqv1;->l(Landroid/os/Bundle;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
