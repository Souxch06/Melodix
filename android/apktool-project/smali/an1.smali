.class public final Lan1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljava/lang/String;

.field public final synthetic k:J

.field public final synthetic l:Lfw1;


# direct methods
.method public constructor <init>(Lfw1;Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lan1;->j:Ljava/lang/String;

    .line 5
    .line 6
    iput-wide p3, p0, Lan1;->k:J

    .line 7
    .line 8
    iput-object p1, p0, Lan1;->l:Lfw1;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lan1;->l:Lfw1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lgx1;->l()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lan1;->j:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v1}, Lbh;->e(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v2, v0, Lfw1;->l:Lda;

    .line 12
    .line 13
    invoke-virtual {v2}, Lu71;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    iget-wide v4, p0, Lan1;->k:J

    .line 18
    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    iput-wide v4, v0, Lfw1;->m:J

    .line 22
    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    invoke-virtual {v2, v1, p0}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ljava/lang/Integer;

    .line 29
    .line 30
    const/4 v3, 0x1

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    add-int/2addr p0, v3

    .line 38
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v2, v1, p0}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    iget p0, v2, Lu71;->l:I

    .line 47
    .line 48
    const/16 v6, 0x64

    .line 49
    .line 50
    if-lt p0, v6, :cond_2

    .line 51
    .line 52
    iget-object p0, v0, Let;->j:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast p0, Ly02;

    .line 55
    .line 56
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 57
    .line 58
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lzy1;->r:Lso;

    .line 62
    .line 63
    const-string v0, "Too many ads visible"

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lso;->b(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v2, v1, p0}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    iget-object p0, v0, Lfw1;->k:Lda;

    .line 77
    .line 78
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p0, v1, v0}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    return-void
.end method
