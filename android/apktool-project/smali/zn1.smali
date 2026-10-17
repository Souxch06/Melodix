.class public final Lzn1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final b:Ld2;

.field public static final c:Lzn1;


# instance fields
.field public final a:Lyn1;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ld2;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-direct {v0, v1}, Ld2;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lzn1;->b:Ld2;

    .line 8
    .line 9
    new-instance v0, Lzn1;

    .line 10
    .line 11
    new-instance v1, Lyn1;

    .line 12
    .line 13
    sget-object v2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 14
    .line 15
    invoke-direct {v1}, Lyn1;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-direct {v0, v1}, Lzn1;-><init>(Lyn1;)V

    .line 19
    .line 20
    .line 21
    sput-object v0, Lzn1;->c:Lzn1;

    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>(Lyn1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lzn1;->a:Lyn1;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lzn1;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lzn1;

    .line 6
    .line 7
    iget-object p1, p1, Lzn1;->a:Lyn1;

    .line 8
    .line 9
    iget-object p0, p0, Lzn1;->a:Lyn1;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Lzn1;->a:Lyn1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lyn1;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    not-int p0, p0

    .line 8
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lzn1;->a:Lyn1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lyn1;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
