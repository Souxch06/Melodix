.class public final Lla0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lv91;


# instance fields
.field public final a:Lkg1;

.field public final b:Llb1;


# direct methods
.method public constructor <init>(Lkg1;Llb1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lla0;->a:Lkg1;

    .line 5
    .line 6
    iput-object p2, p0, Lla0;->b:Llb1;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Exception;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lla0;->b:Llb1;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Llb1;->a(Ljava/lang/Exception;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method public final b(Lcf;)Z
    .locals 9

    .line 1
    iget v0, p1, Lcf;->b:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ne v0, v1, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lla0;->a:Lkg1;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lkg1;->a(Lcf;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object v4, p1, Lcf;->c:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz v4, :cond_0

    .line 18
    .line 19
    iget-wide v5, p1, Lcf;->e:J

    .line 20
    .line 21
    iget-wide v7, p1, Lcf;->f:J

    .line 22
    .line 23
    new-instance v3, Lte;

    .line 24
    .line 25
    invoke-direct/range {v3 .. v8}, Lte;-><init>(Ljava/lang/String;JJ)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lla0;->b:Llb1;

    .line 29
    .line 30
    iget-object p0, p0, Llb1;->a:Ljd2;

    .line 31
    .line 32
    invoke-virtual {p0, v3}, Ljd2;->l(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_0
    const-string p0, "Null token"

    .line 38
    .line 39
    invoke-static {p0}, Lwd1;->d(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return v2
.end method
