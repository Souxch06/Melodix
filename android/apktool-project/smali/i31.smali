.class public abstract Li31;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Lg5;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lg5;->c()Lg5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Li31;->a:Lg5;

    .line 6
    .line 7
    return-void
.end method

.method public static a(Lcom/google/firebase/perf/metrics/Trace;Lm80;)V
    .locals 5

    .line 1
    iget v0, p1, Lm80;->a:I

    .line 2
    .line 3
    iget v1, p1, Lm80;->c:I

    .line 4
    .line 5
    iget p1, p1, Lm80;->b:I

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    const-string v2, "_fr_tot"

    .line 10
    .line 11
    int-to-long v3, v0

    .line 12
    invoke-virtual {p0, v2, v3, v4}, Lcom/google/firebase/perf/metrics/Trace;->putMetric(Ljava/lang/String;J)V

    .line 13
    .line 14
    .line 15
    :cond_0
    if-lez p1, :cond_1

    .line 16
    .line 17
    const-string v0, "_fr_slo"

    .line 18
    .line 19
    int-to-long v2, p1

    .line 20
    invoke-virtual {p0, v0, v2, v3}, Lcom/google/firebase/perf/metrics/Trace;->putMetric(Ljava/lang/String;J)V

    .line 21
    .line 22
    .line 23
    :cond_1
    if-lez v1, :cond_2

    .line 24
    .line 25
    const-string p1, "_fr_fzn"

    .line 26
    .line 27
    int-to-long v0, v1

    .line 28
    invoke-virtual {p0, p1, v0, v1}, Lcom/google/firebase/perf/metrics/Trace;->putMetric(Ljava/lang/String;J)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p0, Lcom/google/firebase/perf/metrics/Trace;->m:Ljava/lang/String;

    .line 32
    .line 33
    sget-object p0, Li31;->a:Lg5;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    return-void
.end method
