.class public final Lmy;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ldh0;


# static fields
.field public static final a:Lmy;

.field public static final b:Lzu0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lmy;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lmy;->a:Lmy;

    .line 7
    .line 8
    new-instance v0, Lzu0;

    .line 9
    .line 10
    const-string v1, "kotlin.Double"

    .line 11
    .line 12
    sget-object v2, Lyu0;->k:Lyu0;

    .line 13
    .line 14
    invoke-direct {v0, v1, v2}, Lzu0;-><init>(Ljava/lang/String;Lyu0;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lmy;->b:Lzu0;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final b(Ll80;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object p0, p1, Ll80;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lz91;

    .line 4
    .line 5
    invoke-virtual {p0}, Lz91;->h()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    :try_start_0
    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 11
    .line 12
    .line 13
    move-result-wide v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    invoke-static {v1, v2}, Ljava/lang/Double;->isInfinite(D)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_0
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {p0, p1}, Lfe1;->D(Lz91;Ljava/lang/Number;)V

    .line 36
    .line 37
    .line 38
    throw v0

    .line 39
    :catch_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v2, "Failed to parse type \'double\' for input \'"

    .line 42
    .line 43
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const/16 p1, 0x27

    .line 50
    .line 51
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const/4 v1, 0x0

    .line 59
    const/4 v2, 0x6

    .line 60
    invoke-static {p0, p1, v1, v2}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 61
    .line 62
    .line 63
    throw v0
.end method

.method public final c(Lqt;Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p2, Ljava/lang/Number;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object p0, p1, Lqt;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Lke2;

    .line 10
    .line 11
    iget-boolean p2, p1, Lqt;->a:Z

    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p1, p2}, Lqt;->j(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p1, p0, Lke2;->k:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p1, Lf4;

    .line 26
    .line 27
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p1, p2}, Lf4;->h(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :goto_0
    invoke-static {v0, v1}, Ljava/lang/Double;->isInfinite(D)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_1

    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object p0, p0, Lke2;->k:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast p0, Lf4;

    .line 54
    .line 55
    invoke-virtual {p0}, Lf4;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p1, p0}, Lfe1;->c(Ljava/lang/Number;Ljava/lang/String;)Lvg0;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    throw p0
.end method

.method public final d()Li41;
    .locals 0

    .line 1
    sget-object p0, Lmy;->b:Lzu0;

    .line 2
    .line 3
    return-object p0
.end method
