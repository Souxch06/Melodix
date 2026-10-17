.class public final synthetic Lhx;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lix;

.field public final synthetic k:I

.field public final synthetic l:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lix;ILjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lhx;->j:Lix;

    .line 5
    .line 6
    iput p2, p0, Lhx;->k:I

    .line 7
    .line 8
    iput-object p3, p0, Lhx;->l:Ljava/lang/Object;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lhx;->l:Ljava/lang/Object;

    .line 2
    .line 3
    iget-object v1, p0, Lhx;->j:Lix;

    .line 4
    .line 5
    iget-object v1, v1, Lix;->b:Lqv0;

    .line 6
    .line 7
    iget p0, p0, Lhx;->k:I

    .line 8
    .line 9
    invoke-interface {v1, p0, v0}, Lqv0;->j(ILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
