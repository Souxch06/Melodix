.class public final Lc50;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:J

.field public b:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x3c

    .line 5
    .line 6
    iput-wide v0, p0, Lc50;->a:J

    .line 7
    .line 8
    const-wide/32 v0, 0xa8c0

    .line 9
    .line 10
    .line 11
    iput-wide v0, p0, Lc50;->b:J

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lc50;)V
    .locals 2

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iget-wide v0, p1, Lc50;->a:J

    .line 16
    iput-wide v0, p0, Lc50;->a:J

    .line 17
    iget-wide v0, p1, Lc50;->b:J

    .line 18
    iput-wide v0, p0, Lc50;->b:J

    return-void
.end method
