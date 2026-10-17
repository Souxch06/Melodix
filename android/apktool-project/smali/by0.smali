.class public final Lby0;
.super Lh11;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final j:Ljava/lang/String;

.field public final k:J

.field public final l:Lsx0;


# direct methods
.method public constructor <init>(Ljava/lang/String;JLsx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lby0;->j:Ljava/lang/String;

    .line 5
    .line 6
    iput-wide p2, p0, Lby0;->k:J

    .line 7
    .line 8
    iput-object p4, p0, Lby0;->l:Lsx0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lby0;->k:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final g()Llm0;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object p0, p0, Lby0;->j:Ljava/lang/String;

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
    iget-object p0, p0, Lby0;->l:Lsx0;

    .line 2
    .line 3
    return-object p0
.end method
