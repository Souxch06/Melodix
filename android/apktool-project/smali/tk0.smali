.class public final Ltk0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ldh0;


# static fields
.field public static final a:Ltk0;

.field public static final b:Lzu0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ltk0;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ltk0;->a:Ltk0;

    .line 7
    .line 8
    new-instance v0, Lzu0;

    .line 9
    .line 10
    const-string v1, "kotlin.Long"

    .line 11
    .line 12
    sget-object v2, Lyu0;->m:Lyu0;

    .line 13
    .line 14
    invoke-direct {v0, v1, v2}, Lzu0;-><init>(Ljava/lang/String;Lyu0;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Ltk0;->b:Lzu0;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final b(Ll80;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll80;->e()J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final c(Lqt;Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p2, Ljava/lang/Number;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Number;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-virtual {p1, v0, v1}, Lqt;->d(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final d()Li41;
    .locals 0

    .line 1
    sget-object p0, Ltk0;->b:Lzu0;

    .line 2
    .line 3
    return-object p0
.end method
