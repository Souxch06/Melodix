.class public final Ln32;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljava/lang/String;

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:J

.field public final synthetic m:J

.field public final synthetic n:Landroid/os/Bundle;

.field public final synthetic o:Z

.field public final synthetic p:Z

.field public final synthetic q:Z

.field public final synthetic r:Lc52;


# direct methods
.method public constructor <init>(Lc52;Ljava/lang/String;Ljava/lang/String;JJLandroid/os/Bundle;ZZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ln32;->j:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p3, p0, Ln32;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-wide p4, p0, Ln32;->l:J

    .line 9
    .line 10
    iput-wide p6, p0, Ln32;->m:J

    .line 11
    .line 12
    iput-object p8, p0, Ln32;->n:Landroid/os/Bundle;

    .line 13
    .line 14
    iput-boolean p9, p0, Ln32;->o:Z

    .line 15
    .line 16
    iput-boolean p10, p0, Ln32;->p:Z

    .line 17
    .line 18
    iput-boolean p11, p0, Ln32;->q:Z

    .line 19
    .line 20
    iput-object p1, p0, Ln32;->r:Lc52;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    .line 1
    iget-boolean v9, p0, Ln32;->p:Z

    .line 2
    .line 3
    iget-boolean v10, p0, Ln32;->q:Z

    .line 4
    .line 5
    iget-object v0, p0, Ln32;->r:Lc52;

    .line 6
    .line 7
    iget-object v1, p0, Ln32;->j:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v2, p0, Ln32;->k:Ljava/lang/String;

    .line 10
    .line 11
    iget-wide v3, p0, Ln32;->l:J

    .line 12
    .line 13
    iget-wide v5, p0, Ln32;->m:J

    .line 14
    .line 15
    iget-object v7, p0, Ln32;->n:Landroid/os/Bundle;

    .line 16
    .line 17
    iget-boolean v8, p0, Ln32;->o:Z

    .line 18
    .line 19
    invoke-virtual/range {v0 .. v10}, Lc52;->u(Ljava/lang/String;Ljava/lang/String;JJLandroid/os/Bundle;ZZZ)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
