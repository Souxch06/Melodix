.class public final Lo52;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lm52;

.field public final synthetic k:Lm52;

.field public final synthetic l:J

.field public final synthetic m:Z

.field public final synthetic n:Lz52;


# direct methods
.method public constructor <init>(Lz52;Lm52;Lm52;JZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lo52;->j:Lm52;

    .line 5
    .line 6
    iput-object p3, p0, Lo52;->k:Lm52;

    .line 7
    .line 8
    iput-wide p4, p0, Lo52;->l:J

    .line 9
    .line 10
    iput-boolean p6, p0, Lo52;->m:Z

    .line 11
    .line 12
    iput-object p1, p0, Lo52;->n:Lz52;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-boolean v5, p0, Lo52;->m:Z

    .line 2
    .line 3
    const/4 v6, 0x0

    .line 4
    iget-object v0, p0, Lo52;->n:Lz52;

    .line 5
    .line 6
    iget-object v1, p0, Lo52;->j:Lm52;

    .line 7
    .line 8
    iget-object v2, p0, Lo52;->k:Lm52;

    .line 9
    .line 10
    iget-wide v3, p0, Lo52;->l:J

    .line 11
    .line 12
    invoke-virtual/range {v0 .. v6}, Lz52;->r(Lm52;Lm52;JZLandroid/os/Bundle;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
