.class public final Lyx;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field public final j:Ljava/lang/String;

.field public final k:J

.field public final l:Ljava/util/ArrayList;

.field public final synthetic m:Lay;


# direct methods
.method public constructor <init>(Lay;Ljava/lang/String;JLjava/util/ArrayList;[J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lyx;->m:Lay;

    .line 11
    .line 12
    iput-object p2, p0, Lyx;->j:Ljava/lang/String;

    .line 13
    .line 14
    iput-wide p3, p0, Lyx;->k:J

    .line 15
    .line 16
    iput-object p5, p0, Lyx;->l:Ljava/util/ArrayList;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 3

    .line 1
    iget-object p0, p0, Lyx;->l:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    add-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    check-cast v2, Lp81;

    .line 17
    .line 18
    invoke-static {v2}, Ljg1;->b(Ljava/io/Closeable;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void
.end method
