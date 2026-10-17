.class public final Lm52;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:J

.field public d:Z

.field public final e:Z

.field public final f:J

.field public final g:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 10

    const-wide/16 v6, 0x0

    const-wide/16 v8, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    .line 20
    invoke-direct/range {v0 .. v9}, Lm52;-><init>(Ljava/lang/String;Ljava/lang/String;JZJJ)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JZJJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lm52;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lm52;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-wide p3, p0, Lm52;->c:J

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lm52;->d:Z

    .line 12
    .line 13
    iput-boolean p5, p0, Lm52;->e:Z

    .line 14
    .line 15
    iput-wide p6, p0, Lm52;->f:J

    .line 16
    .line 17
    iput-wide p8, p0, Lm52;->g:J

    .line 18
    .line 19
    return-void
.end method
