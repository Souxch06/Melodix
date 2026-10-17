.class public final Lgu1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic j:Lms1;

.field public final synthetic k:Ler0;


# direct methods
.method public constructor <init>(Lms1;Ler0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lgu1;->j:Lms1;

    .line 5
    .line 6
    iput-object p2, p0, Lgu1;->k:Ler0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 4

    .line 1
    check-cast p1, Lst1;

    .line 2
    .line 3
    instance-of v0, p1, Lzt1;

    .line 4
    .line 5
    check-cast p2, Lst1;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    instance-of p0, p2, Lzt1;

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    return v2

    .line 16
    :cond_0
    return v1

    .line 17
    :cond_1
    instance-of v0, p2, Lzt1;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    const/4 p0, -0x1

    .line 22
    return p0

    .line 23
    :cond_2
    iget-object v0, p0, Lgu1;->j:Lms1;

    .line 24
    .line 25
    if-nez v0, :cond_3

    .line 26
    .line 27
    invoke-interface {p1}, Lst1;->e()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {p2}, Lst1;->e()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_3
    const/4 v3, 0x2

    .line 41
    new-array v3, v3, [Lst1;

    .line 42
    .line 43
    aput-object p1, v3, v1

    .line 44
    .line 45
    aput-object p2, v3, v2

    .line 46
    .line 47
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object p0, p0, Lgu1;->k:Ler0;

    .line 52
    .line 53
    invoke-virtual {v0, p0, p1}, Lms1;->a(Ler0;Ljava/util/List;)Lst1;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 62
    .line 63
    .line 64
    move-result-wide p0

    .line 65
    invoke-static {p0, p1}, Lbe2;->T(D)D

    .line 66
    .line 67
    .line 68
    move-result-wide p0

    .line 69
    double-to-int p0, p0

    .line 70
    return p0
.end method
