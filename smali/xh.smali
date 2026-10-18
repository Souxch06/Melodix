.class public final Lxh;
.super Lh11;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final j:Lyx;

.field public final k:Ljava/lang/String;

.field public final l:Ljava/lang/String;

.field public final m:Lsx0;


# direct methods
.method public constructor <init>(Lyx;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lxh;->j:Lyx;

    .line 5
    .line 6
    iput-object p2, p0, Lxh;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lxh;->l:Ljava/lang/String;

    .line 9
    .line 10
    const/4 p2, 0x1

    .line 11
    iget-object p1, p1, Lyx;->l:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lp81;

    .line 18
    .line 19
    new-instance p2, Lwh;

    .line 20
    .line 21
    invoke-direct {p2, p1, p0}, Lwh;-><init>(Lp81;Lxh;)V

    .line 22
    .line 23
    .line 24
    new-instance p1, Lsx0;

    .line 25
    .line 26
    invoke-direct {p1, p2}, Lsx0;-><init>(Lp81;)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lxh;->m:Lsx0;

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public final a()J
    .locals 3

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    iget-object p0, p0, Lxh;->l:Ljava/lang/String;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object v2, Ljg1;->a:[B

    .line 8
    .line 9
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    :catch_0
    :cond_0
    return-wide v0
.end method

.method public final g()Llm0;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object p0, p0, Lxh;->k:Ljava/lang/String;

    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    sget-object v1, Llm0;->b:Ljava/util/regex/Pattern;

    .line 7
    .line 8
    :try_start_0
    invoke-static {p0}, Ldl1;->g(Ljava/lang/String;)Llm0;

    .line 9
    .line 10
    .line 11
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    return-object p0

    .line 13
    :catch_0
    :cond_0
    return-object v0
.end method

.method public final h()Llh;
    .locals 0

    .line 1
    iget-object p0, p0, Lxh;->m:Lsx0;

    .line 2
    .line 3
    return-object p0
.end method
