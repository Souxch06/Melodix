.class public abstract Lji;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lbh0;
.implements Ljava/io/Serializable;


# instance fields
.field public transient j:Lbh0;

.field public final k:Ljava/lang/Object;

.field public final l:Ljava/lang/Class;

.field public final m:Ljava/lang/String;

.field public final n:Ljava/lang/String;

.field public final o:Z


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lji;->k:Ljava/lang/Object;

    .line 5
    .line 6
    iput-object p2, p0, Lji;->l:Ljava/lang/Class;

    .line 7
    .line 8
    iput-object p3, p0, Lji;->m:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Lji;->n:Ljava/lang/String;

    .line 11
    .line 12
    iput-boolean p5, p0, Lji;->o:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public abstract c()Lbh0;
.end method

.method public final d()Lfk;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lji;->o:Z

    .line 2
    .line 3
    iget-object p0, p0, Lji;->l:Ljava/lang/Class;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Liz0;->a:Ljz0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    new-instance v0, Lms0;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lms0;-><init>(Ljava/lang/Class;)V

    .line 15
    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_0
    invoke-static {p0}, Liz0;->a(Ljava/lang/Class;)Lhk;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method
