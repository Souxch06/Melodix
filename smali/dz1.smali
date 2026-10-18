.class public final Ldz1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final j:Lcz1;

.field public final k:I

.field public final l:Ljava/lang/Throwable;

.field public final m:[B

.field public final n:Ljava/lang/String;

.field public final o:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcz1;ILjava/io/IOException;[BLjava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ldz1;->j:Lcz1;

    .line 5
    .line 6
    iput p3, p0, Ldz1;->k:I

    .line 7
    .line 8
    iput-object p4, p0, Ldz1;->l:Ljava/lang/Throwable;

    .line 9
    .line 10
    iput-object p5, p0, Ldz1;->m:[B

    .line 11
    .line 12
    iput-object p1, p0, Ldz1;->n:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p6, p0, Ldz1;->o:Ljava/util/Map;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v4, p0, Ldz1;->m:[B

    .line 2
    .line 3
    iget-object v5, p0, Ldz1;->o:Ljava/util/Map;

    .line 4
    .line 5
    iget-object v0, p0, Ldz1;->j:Lcz1;

    .line 6
    .line 7
    iget-object v1, p0, Ldz1;->n:Ljava/lang/String;

    .line 8
    .line 9
    iget v2, p0, Ldz1;->k:I

    .line 10
    .line 11
    iget-object v3, p0, Ldz1;->l:Ljava/lang/Throwable;

    .line 12
    .line 13
    invoke-interface/range {v0 .. v5}, Lcz1;->a(Ljava/lang/String;ILjava/lang/Throwable;[BLjava/util/Map;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
