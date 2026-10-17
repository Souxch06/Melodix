.class public final synthetic Lg52;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lh52;

.field public final synthetic k:I

.field public final synthetic l:Ljava/lang/Exception;

.field public final synthetic m:[B


# direct methods
.method public synthetic constructor <init>(Lh52;ILjava/lang/Exception;[BLjava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lg52;->j:Lh52;

    .line 5
    .line 6
    iput p2, p0, Lg52;->k:I

    .line 7
    .line 8
    iput-object p3, p0, Lg52;->l:Ljava/lang/Exception;

    .line 9
    .line 10
    iput-object p4, p0, Lg52;->m:[B

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final synthetic run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lg52;->m:[B

    .line 2
    .line 3
    iget-object v1, p0, Lg52;->j:Lh52;

    .line 4
    .line 5
    iget-object v1, v1, Lh52;->l:Lf52;

    .line 6
    .line 7
    iget v2, p0, Lg52;->k:I

    .line 8
    .line 9
    iget-object p0, p0, Lg52;->l:Ljava/lang/Exception;

    .line 10
    .line 11
    invoke-interface {v1, v2, p0, v0}, Lf52;->b(ILjava/lang/Throwable;[B)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
